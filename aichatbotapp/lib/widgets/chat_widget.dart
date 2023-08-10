import 'package:aichatbotapp/constants/constants.dart';
import 'package:aichatbotapp/services/asset_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  AssetManager.userImage,
                  height: 30,
                  width: 30,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
