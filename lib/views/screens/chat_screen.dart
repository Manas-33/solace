import 'package:flutter/material.dart';
import 'package:solace/controllers/openai_service.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final OpenAIController x = OpenAIController();
  String res = "No response Yet";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.maxFinite,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    String s =
                        await x.getResponse("Give some names for mumbai");
                    setState(() {
                      res = s;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding:
                        const EdgeInsets.all(16.0), // Adjust padding as needed
                  ),
                  child: Icon(Icons.arrow_forward_ios)),
              Text(res)
            ]),
      ),
    );
  }
}
