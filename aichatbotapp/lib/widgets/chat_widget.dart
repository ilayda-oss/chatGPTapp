import 'dart:math';

import 'package:aichatbotapp/constants/constants.dart';
import 'package:aichatbotapp/services/asset_managers.dart';
import 'package:aichatbotapp/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetManager.userImage
                      : AssetManager.openaiImage,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(child: TextWidget(label: msg)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
