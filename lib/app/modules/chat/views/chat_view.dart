import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_supabase_app/app/constants/widget_const.dart';
import 'package:getx_supabase_app/app/data/models/message.dart';
import 'package:getx_supabase_app/app/modules/chat/views/chat_bubble_view.dart';
import 'package:getx_supabase_app/app/modules/chat/views/message_bar_view.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: StreamBuilder<List<Message>>(
        stream: controller.messageStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final messages = snapshot.data;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: (messages ?? []).isEmpty
                      ? const Center(
                          child: Text('Start your conversation now :)'))
                      : ListView.builder(
                          reverse: true,
                          itemCount: messages?.length,
                          itemBuilder: (context, index) {
                            final message = messages?[index];

                            controller
                                .loadProfileCache("${message?.profileId}");

                            return ChatBubbleView(
                              message: message!,
                              profile: controller
                                  .profileCache["${message.profileId}"],
                            );
                          },
                        ),
                ),
                MessageBarView(),
              ],
            );
          }

          return preloader;
        },
      ),
    );
  }
}
