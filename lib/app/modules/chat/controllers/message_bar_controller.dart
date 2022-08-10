import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/supabase_const.dart';

class MessageBarController extends GetxController {
  final textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    textController.dispose();
  }

  void submitMessage() async {
    final text = textController.text;
    final myUserId = supabase.auth.currentUser?.id;

    if (text.isEmpty) return;

    textController.clear();

    final res = await supabase.from('messages').insert({
      'profile_id': myUserId,
      'content': text,
    }).execute();
    final error = res.error;

    if (error != null) Get.snackbar("Error", "${error.message}");
  }
}
