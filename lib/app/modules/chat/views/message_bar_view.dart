import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_supabase_app/app/modules/chat/controllers/message_bar_controller.dart';

class MessageBarView extends GetView {
  @override
  Widget build(BuildContext context) {
    final messageBarController = Get.put(MessageBarController());
    return Material(
      color: Colors.grey,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: null,
                  autofocus: true,
                  controller: messageBarController.textController,
                  decoration: const InputDecoration(
                    hintText: 'Type a message',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
              TextButton(
                onPressed: messageBarController.submitMessage,
                child: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
