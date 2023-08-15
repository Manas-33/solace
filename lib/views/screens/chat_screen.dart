import 'package:flutter/material.dart';
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
          decoration: InputDecoration.collapsed(hintText: "Ask your query"),
        )),
        IconButton(onPressed: () => sendMessage(), icon: Icon(Icons.send))
      ],
    );
  }

  void sendMessage() async {
    if (_controller.text != "") {
      ChatMessage _message =
          ChatMessage(text: _controller.text, sender: "user");
      setState(() {
        _messages.insert(0, _message);
      });
      _controller.clear();

      await chatGPT.getResponse(_message.text).then((value) {
        ChatMessage botMessage = ChatMessage(text: value, sender: "bot");
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
      child: Padding(
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
          Container(
            decoration: BoxDecoration(),
            child: _textField(),
          )
        ]),
      ),
    ));
  }
}
