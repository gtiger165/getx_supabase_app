import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_supabase_app/app/constants/widget_const.dart';
import 'package:getx_supabase_app/app/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends SupabaseAuthState<SplashView> {
  @override
  void initState() {
    super.initState();
    recoverSupabaseSession();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: preloader);
  }

  @override
  void onAuthenticated(Session session) {
    Get.offNamed(Routes.CHAT);
  }

  @override
  void onErrorAuthenticating(String message) {}

  @override
  void onPasswordRecovery(Session session) {}

  @override
  void onUnauthenticated() {
    Get.offNamed(Routes.REGISTER);
  }
}
