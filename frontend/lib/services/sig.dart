import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class Signaling {
  final Map<String, dynamic> _iceServers = {
    'iceServers': [
      {
        'urls': [
          'stun:stun.l.google.com:19302',
          'stun:stun1.l.google.com:19302',
        ]
      },
    ]
  };

  final Map<String, dynamic> _mediaConstraints = {
    'audio': true,
    'video': false,
  };

  RTCPeerConnection? _peerConnection;
  MediaStream? _localStream;
  StreamStateCallback? onAddRemoteStream;

  // Initialize the peer connection and the local stream
  Future<void> initPeerConnection() async {
    _peerConnection = await createPeerConnection(
      _iceServers,
      _mediaConstraints,
    );
    _localStream = await _getUserMedia();
    _registerPeerConnectionListeners();

    // Add local stream to peer connection
    _localStream!.getTracks().forEach((track) {
      _peerConnection!.addTrack(track, _localStream!);
    });
  }

  // Getting user media
  Future<MediaStream> _getUserMedia() async {
    final Map<String, dynamic> mediaConstraints = {
      'audio': true,
      'video': false,
    };

    MediaStream stream = await navigator.mediaDevices.getUserMedia(
      mediaConstraints,
    );
    return stream;
  }

  // Registering peer connection listeners
  void _registerPeerConnectionListeners() {
    _peerConnection!.onIceCandidate = (RTCIceCandidate candidate) {
      // Handle ICE candidate
      log('ICE onIceCandidate: ${candidate.toMap()}');
    };

    _peerConnection!.onIceConnectionState = (RTCIceConnectionState state) {
      log('ICE onIceConnectionState: $state');
    };

    _peerConnection!.onTrack = (RTCTrackEvent event) {
      log('ICE onTrack: Stream ID: ${event.streams[0].id}');
      if (event.track.kind == 'audio') {
        onAddRemoteStream?.call(event.streams[0]);
      }
    };
  }

  // Create Room
  Future<String> createRoom() async {
    var db = FirebaseFirestore.instance;
    var roomRef = db.collection('rooms').doc();

    // Save the offer in Firestore
    RTCSessionDescription offer =
        await _peerConnection!.createOffer(_mediaConstraints);
    await _peerConnection!.setLocalDescription(offer);

    var roomWithOffer = {
      'offer': {
        'type': offer.type,
        'sdp': offer.sdp,
      },
    };
    await roomRef.set(roomWithOffer);

    // Handle ICE candidates
    _peerConnection!.onIceCandidate = (RTCIceCandidate candidate) async {
      await roomRef.collection('iceCandidates').add(candidate.toMap());
    };

    return roomRef.id;
  }

  // Join Room
  Future<void> joinRoom(String roomId) async {
    var db = FirebaseFirestore.instance;
    var roomRef = db.collection('rooms').doc(roomId);
    var roomSnapshot = await roomRef.get();

    if (roomSnapshot.exists) {
      var data = roomSnapshot.data()!;
      var offer = data['offer'];

      await _peerConnection!.setRemoteDescription(
        RTCSessionDescription(offer['sdp'], offer['type']),
      );

      // Create an answer to an offer
      RTCSessionDescription answer =
          await _peerConnection!.createAnswer(_mediaConstraints);
      await _peerConnection!.setLocalDescription(answer);

      var roomWithAnswer = {
        'answer': {
          'type': answer.type,
          'sdp': answer.sdp,
        },
      };
      await roomRef.update(roomWithAnswer);

      // Listen for remote ICE candidates
      roomRef.collection('iceCandidates').snapshots().listen((snapshot) {
        for (var change in snapshot.docChanges) {
          if (change.type == DocumentChangeType.added) {
            var candidateData = change.doc.data()!;
            _peerConnection!.addCandidate(
              RTCIceCandidate(
                candidateData['candidate'],
                candidateData['sdpMid'],
                candidateData['sdpMLineIndex'],
              ),
            );
          }
        }
      });
    }
  }

  // Clean up resources
  Future<void> hangUp() async {
    if (_localStream != null) {
      _localStream!.getTracks().forEach((track) {
        track.stop();
      });
    }
    await _peerConnection?.close();
    _peerConnection = null;
    _localStream = null;
  }
}

typedef StreamStateCallback = void Function(MediaStream stream);
