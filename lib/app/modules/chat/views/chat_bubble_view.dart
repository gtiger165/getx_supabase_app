import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_supabase_app/app/constants/widget_const.dart';
import 'package:timeago/timeago.dart';

import '../../../data/models/message.dart';
import '../../../data/models/profile.dart';

class ChatBubbleView extends GetView {
  ChatBubbleView({required this.message, this.profile});

  final Message message;
  final Profile? profile;

  @override
  Widget build(BuildContext context) {
    List<Widget> chatContents = [
      if (!message.isMine)
        CircleAvatar(
          child: profile == null
              ? preloader
              : Text("${profile?.username.substring(0, 2)}"),
        ),
      const SizedBox(height: 12),
      Flexible(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            color: message.isMine
                ? Theme.of(context).primaryColor
                : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text("${message.content}"),
        ),
      ),
      const SizedBox(height: 12),
      Text(format(message.createdAt, locale: 'en_short')),
      const SizedBox(width: 60),
    ];

    if (message.isMine) chatContents = chatContents.reversed.toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      child: Row(
        mainAxisAlignment:
            message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: chatContents,
      ),
    );
  }
}
