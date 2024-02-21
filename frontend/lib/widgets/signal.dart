import 'package:flutter/material.dart';
import 'package:therapease/services/signaling.dart';
import 'package:therapease/utils/utils.dart';

class SignalingScreen extends StatefulWidget {
  const SignalingScreen({Key? key}) : super(key: key);

  @override
  State<SignalingScreen> createState() => _SignalingScreenState();
}

class _SignalingScreenState extends State<SignalingScreen> {
  Signaling signaling = Signaling();
  late final TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();

    textEditingController = TextEditingController(text: '');
    signaling.onAddRemoteStream = ((stream) {
      // Handle remote stream, primarily audio in this case
      debugPrint('ICE Stream ID: ${stream.id}');
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('ICEx ${textEditingController.text}');
    // textEditingController.text = 'oHHmgvieOTGB7Ze09AiU';

    return Scaffold(
      appBar: AppBar(
        title: const Text("WebRTCs"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Wrap(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await signaling.openUserMedia();
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
                onPressed: () {
                  // Add roomId
                  signaling.joinRoom(
                    textEditingController.text.trim(),
                  );
                },
                child: const Text("Join room"),
              ),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () async {
                  textEditingController.clear();
                  await signaling.hangUp();
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
                const Text("Join the following Room: "),
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
