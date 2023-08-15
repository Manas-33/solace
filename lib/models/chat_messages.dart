import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key, required this.text, required this.sender});
  final String text;
  final String sender;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          sender == "bot" ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (sender == "bot")
          Container(
            height: 20,
            width: 20,
            // margin: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text(
                sender[0],
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
        if (sender == "bot")
          BubbleSpecialThree(
            text: text,
            color: Color(0xFFE8E8EE),
            tail: true,
            textStyle: TextStyle(color: Colors.black, fontSize: 16),
            isSender: false,
          ),
        if (sender == "user")
          BubbleSpecialThree(
            text: text,
            color: Color(0xFF1B97F3),
            tail: true,
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
            isSender: true,
          ),
        if (sender == "user")
          Container(
            height: 20,
            width: 20,
            // margin: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text(
                sender[0],
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),

        // Expanded(
        //     child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(sender),
        //     Container(
        //       margin: const EdgeInsets.only(top: 5),
        //       child: Text(text),
        //     )
        //   ],
        // ))
      ],
    );
  }
}
