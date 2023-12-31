import 'package:aichatbotapp/widgets/dropdown_wigdet.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/text_widget.dart';

class Services {
  static Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
        )),
        backgroundColor: scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                    child: TextWidget(
                  label: "Chosen Model:",
                  fontSize: 16,
                )),
                Flexible(flex: 2, child: ModelsDropDownWidget())
              ],
            ),
          );
        });
  }
}
