import 'package:aichatbotapp/constants/constants.dart';
import 'package:aichatbotapp/services/api_services.dart';
import 'package:aichatbotapp/services/services.dart';
import 'package:aichatbotapp/widgets/chat_widget.dart';
import 'package:aichatbotapp/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../providers/models_provider.dart';
import '../services/asset_managers.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping = true;
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetManager.openaiImage),
        ),
        title: const Text("ChatGPT"),
        actions: [
          IconButton(
              onPressed: () async {
                await Services.showModalSheet(context: context);
              },
              icon: const Icon(Icons.more_vert_rounded, color: Colors.white)),
        ],
      ),
      body: SafeArea(
        child: Column(children: [
          Flexible(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return ChatWidget(
                  msg: chatMessages[index]["msg"].toString(),
                  chatIndex:
                      int.parse(chatMessages[index]["chatIndex"].toString()),
                );
              },
            ),
          ),
          if (_isTyping) ...[
            const SpinKitThreeBounce(
              color: Colors.white,
              size: 18,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                color: cardColor,
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: textEditingController,
                      onSubmitted: (value) {
                        // send message
                      },
                      decoration: const InputDecoration.collapsed(
                          hintText: "How can i help you",
                          hintStyle: TextStyle(color: Colors.grey)),
                    )),
                    IconButton(
                        onPressed: () async {
                          try {
                            await ApiService.sendMessage(
                              message: textEditingController.text,
                              modelId: modelsProvider.getCurrentModel,
                            );
                          } catch (error) {
                            print("error $error");
                          }
                        },
                        icon: Icon(Icons.send))
                  ],
                ),
              ),
            ),
          ]
        ]),
      ),
    );
  }
}
