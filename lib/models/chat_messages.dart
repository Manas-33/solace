import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key, required this.text, required this.sender});
  final String text;
  final String sender;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          sender == "Bot" ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (sender == "Bot")
          Container(
            height: 20,
            width: 20,
            // margin: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
                backgroundColor: Color(0xFF1D5C41),
                child: Icon(
                  Icons.bolt,
                  size: 15,
                )
                // Text(
                //   sender[0],
                //   style: TextStyle(fontSize: 10),
                // ),
                ),
          ),
        if (sender == "Bot")
          BubbleSpecialThree(
            text: text,
            color: Color.fromARGB(255, 153, 220, 189),
            tail: true,
            textStyle:
                GoogleFonts.poppins(color: Colors.black, fontSize: 15.75),
            isSender: false,
          ),
        if (sender == "User")
          BubbleSpecialThree(
            text: text,
            color: Color(0xFFCAC6C3),
            tail: true,
            textStyle:
                GoogleFonts.poppins(color: Colors.black, fontSize: 15.75),
            isSender: true,
          ),
        if (sender == "User")
          Container(
            height: 20,
            width: 20,
            // margin: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
                backgroundColor: Color(0xFF1D5C41),
                child: Icon(
                  Icons.person,
                  size: 15,
                )
                // Text(
                //   sender[0],
                //   style: TextStyle(fontSize: 10),
                // ),
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
