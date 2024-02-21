import 'package:flutter/material.dart';
import 'package:therapease/services/sig.dart';

class SignalingScreen2 extends StatefulWidget {
  const SignalingScreen2({Key? key}) : super(key: key);

  @override
  State<SignalingScreen2> createState() => _SignalingScreen2State();
}

class _SignalingScreen2State extends State<SignalingScreen2> {
  Signaling signaling = Signaling();
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: '');
    signaling.initPeerConnection();

    signaling.onAddRemoteStream = (stream) {
      // Handle remote stream if needed, for example, playing audio
      setState(() {});
      debugPrint('ICE ${stream.id}');
    };
  }

  @override
  void dispose() {
    signaling.hangUp();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('ICE ${textEditingController.text}');
    // textEditingController.text = 'lb3H3j92St57AKejNsAU';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Call"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Wrap(
            children: [
              ElevatedButton(
                onPressed: () async {
                  var roomId = await signaling.createRoom();
                  setState(() {});
                  textEditingController.text = roomId;
                },
                child: const Text("Create room"),
              ),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () async {
                  signaling.joinRoom(textEditingController.text.trim());
                },
                child: const Text("Join room"),
              ),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  signaling.hangUp();
                },
                child: const Text("Hangup"),
              )
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Room ID: "),
                Flexible(
                  child: TextFormField(
                    controller: textEditingController,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 60)
        ],
      ),
    );
  }
}
