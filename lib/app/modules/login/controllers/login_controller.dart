import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_supabase_app/app/constants/supabase_const.dart';
import 'package:getx_supabase_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> _signIn() async {
    isLoading.value = true;

    final res = await supabase.auth.signIn(
      email: emailController.text,
      password: passwordController.text,
    );
    final err = res.error;
    isLoading.value = false;

    if (err != null) {
      Get.snackbar("Error", "${err.message}");
      return;
    }

    Get.offAllNamed(Routes.CHAT);
  }

  void onLoginCallback() => _signIn();
}
