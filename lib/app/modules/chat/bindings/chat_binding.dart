import 'package:get/get.dart';

import 'package:getx_supabase_app/app/modules/chat/controllers/message_bar_controller.dart';

import '../controllers/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageBarController>(
      () => MessageBarController(),
    );
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
  }
}
