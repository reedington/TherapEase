import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

typedef StreamStateCallback = void Function(MediaStream stream);

class Signaling {
  Map<String, dynamic> configuration = {
    'iceServers': [
      {
        'urls': [
          "stun:stun1.l.google.com:19302",
          "stun:stun2.l.google.com:19302",
          "stun:stun.l.google.com:19302",
          "stun:stun3.l.google.com:19302",
          "stun:stun4.l.google.com:19302",
        ]
      },
    ]
  };
  final Map<String, dynamic> mediaConstraints = {
    'audio': true,
    'video': false,
    'disableNetworkMonitor': false,
    'disableEncryption': false,
  };

  RTCPeerConnection? peerConnection;
  MediaStream? localStream;
  MediaStream? remoteStream;
  String? roomId;
  String? currentRoomText;
  StreamStateCallback? onAddRemoteStream;

  Future<String> createRoom() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentReference roomRef = db.collection('rooms').doc();

    peerConnection = await createPeerConnection(
      configuration,
      mediaConstraints,
    );

    registerPeerConnectionListeners();

    localStream?.getTracks().forEach((track) {
      peerConnection?.addTrack(track, localStream!);
    });

    // Collecting ICE candidates...
    var callerCandidatesCollection = roomRef.collection('callerCandidates');
    peerConnection?.onIceCandidate = (RTCIceCandidate candidate) {
      callerCandidatesCollection.add(candidate.toMap());
    };

    // Creating a room...
    RTCSessionDescription offer =
        await peerConnection!.createOffer(mediaConstraints);
    await peerConnection!.setLocalDescription(offer);

    Map<String, dynamic> roomWithOffer = {'offer': offer.toMap()};
    await roomRef.set(roomWithOffer);
    roomId = roomRef.id;
    currentRoomText = 'Current room is $roomId - You are the caller!';

    peerConnection?.onTrack = (RTCTrackEvent event) {
      log('ICE CREATE from create $remoteStream');
      event.streams[0].getTracks().forEach((track) {
        remoteStream?.addTrack(track);
      });
    };
    return roomId!;
  }

  Future<void> joinRoom(String id) async {
    roomId = id;
    FirebaseFirestore db = FirebaseFirestore.instance;
    var roomRef = db.collection('rooms').doc(id);
    var roomSnapshot = await roomRef.get();

    if (roomSnapshot.exists) {
      peerConnection = await createPeerConnection(
        configuration,
        mediaConstraints,
      );

      registerPeerConnectionListeners();

      localStream?.getTracks().forEach((track) {
        peerConnection?.addTrack(track, localStream!);
      });

      // Code for collecting ICE candidates below
      var calleeCandidatesCollection = roomRef.collection('calleeCandidates');
      peerConnection!.onIceCandidate = (RTCIceCandidate? candidate) {
        if (candidate == null) {
          return;
        }
        calleeCandidatesCollection.add(candidate.toMap());
      };

      peerConnection?.onTrack = (RTCTrackEvent event) {
        log('ICE JOIN from create $remoteStream');
        event.streams[0].getTracks().forEach((track) {
          remoteStream?.addTrack(track);
        });
      };

      // Code for creating SDP answer below
      var data = roomSnapshot.data() as Map<String, dynamic>;
      var offer = data['offer'];
      await peerConnection?.setRemoteDescription(
        RTCSessionDescription(offer['sdp'], offer['type']),
      );

      var answer = await peerConnection!.createAnswer(mediaConstraints);

      await peerConnection!.setLocalDescription(answer);

      Map<String, dynamic> roomWithAnswer = {
        'answer': {'type': answer.type, 'sdp': answer.sdp}
      };

      await roomRef.update(roomWithAnswer);
      // Finished creating SDP answer

      // Listening for remote ICE candidates below
      roomRef.collection('callerCandidates').snapshots().listen((snapshot) {
        for (var document in snapshot.docChanges) {
          var data = document.doc.data() as Map<String, dynamic>;
          peerConnection!.addCandidate(
            RTCIceCandidate(
              data['candidate'],
              data['sdpMid'],
              data['sdpMLineIndex'],
            ),
          );
        }
      });
    }
  }

  Future<void> openUserMedia() async {
    var stream = await navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': false,
    });

    localStream = stream;
  }

  Future<void> hangUp() async {
    // Stop all tracks on the local stream
    if (localStream != null) {
      localStream!.getTracks().forEach((track) {
        track.stop();
      });
      await localStream!.dispose();
    }

    // Stop all tracks on the remote stream, if it exists
    if (remoteStream != null) {
      remoteStream!.getTracks().forEach((track) => track.stop());
      await remoteStream?.dispose();
    }

    // Close the peer connection, if it exists
    if (peerConnection != null) {
      await peerConnection!.close();
    }
    if (roomId != null) {
      var db = FirebaseFirestore.instance;
      var roomRef = db.collection('rooms').doc(roomId);
      var calleeCandidates = await roomRef.collection('calleeCandidates').get();
      for (var document in calleeCandidates.docs) {
        await document.reference.delete();
      }

      var callerCandidates = await roomRef.collection('callerCandidates').get();
      for (var document in callerCandidates.docs) {
        await document.reference.delete();
      }
      await roomRef.delete();
    }

    if (localStream != null) {
      localStream?.getTracks().forEach((track) {
        track.stop();
      });
    }

    // Resetting local and remote streams to null might be a good practice
    roomId = null;
    localStream = null;
    remoteStream = null;
  }

  void registerPeerConnectionListeners() {
    peerConnection?.onIceGatheringState = (RTCIceGatheringState state) {
      log('ICE ICE gathering state changed: $state');
    };

    peerConnection?.onConnectionState = (RTCPeerConnectionState state) {
      log('ICE Connection state change: $state');
    };

    peerConnection?.onSignalingState = (RTCSignalingState state) {
      log('ICE Signaling state change: $state');
    };

    peerConnection?.onIceGatheringState = (RTCIceGatheringState state) {
      log('ICE connection state change: $state');
    };

    peerConnection?.onAddStream = (MediaStream stream) {
      log("ICE onAddStream");
      onAddRemoteStream?.call(stream);
      remoteStream = stream;
    };

    peerConnection?.onIceConnectionState = (state) {
      log("ICE ICEConnection State Changed: $state");
    };

    peerConnection?.onTrack = (RTCTrackEvent event) {
      log('ICE onTrack: Stream ID: ${event.streams[0].id}');
      if (remoteStream == null) {
        // Instantiate remoteStream with the first received stream
        remoteStream = event.streams[0];
      } else {
        // If _remoteStream is already instantiated, you might want to add new tracks to it
        // However, usually, all tracks are received in the same stream for a given peer connection
        event.streams[0].getTracks().forEach((track) {
          remoteStream!.addTrack(track);
        });
      }

      // This is where you might want to update the UI or inform other parts of your application
      // that the remote stream is available or has been updated.
      // For example:
      onAddRemoteStream?.call(remoteStream!);
    };
  }
}
