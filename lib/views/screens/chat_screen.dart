import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solace/models/chat_messages.dart';

import '../../controllers/openai_service.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final OpenAIController chatGPT = OpenAIController();

  Widget _textField() {
    return Row(
      children: [
        Expanded(
            child: TextField(
          onSubmitted: (value) => sendMessage(),
          controller: _controller,
          decoration: InputDecoration.collapsed(
              hintText: "Ask your query",
              hintStyle: GoogleFonts.poppins(),
              border: InputBorder.none),
        )),
        IconButton(
            onPressed: () => sendMessage(),
            icon: Icon(
              Icons.send,
              color: Color(0xFF1D5C41),
            ))
      ],
    );
  }

  void sendMessage() async {
    if (_controller.text != "") {
      ChatMessage _message =
          ChatMessage(text: _controller.text, sender: "User");
      setState(() {
        _messages.insert(0, _message);
      });
      _controller.clear();

      await chatGPT.getResponse(_message.text).then((value) {
        ChatMessage botMessage = ChatMessage(text: value, sender: "Bot");
        setState(() {
          _messages.insert(0, botMessage);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        // appBar: AppBar(),
        body: SafeArea(
      child: Container(
        // color: Color.fromARGB(131, 219, 52, 52),
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Flexible(
              child: ListView.builder(
            reverse: true,
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: _messages[index],
              );
            },
          )),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: _textField(),
          )
        ]),
      ),
    ));
  }
}
