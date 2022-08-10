import 'package:get/get.dart';
import 'package:getx_supabase_app/app/constants/supabase_const.dart';
import 'package:getx_supabase_app/app/data/models/message.dart';
import 'package:getx_supabase_app/app/data/models/profile.dart';

class ChatController extends GetxController {
  late final Stream<List<Message>> messageStream;
  Map<String, Profile> profileCache = {};

  @override
  void onInit() {
    final myUserId = supabase.auth.currentUser?.id;
    messageStream = supabase
        .from('messages')
        .stream(['id'])
        .order('created_at')
        .execute()
        .map((datas) => datas
            .map((e) => Message.fromMap(map: e, myUserId: "$myUserId"))
            .toList());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> loadProfileCache(String profileId) async {
    if (profileCache[profileId] != null) return;

    final res = await supabase
        .from('profiles')
        .select()
        .match({'id': profileId})
        .single()
        .execute();
    final data = res.data;
    if (data != null) {
      final profile = Profile.fromMap(data);
      profileCache[profileId] = profile;
    }
  }
}
