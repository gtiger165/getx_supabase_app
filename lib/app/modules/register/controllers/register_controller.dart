import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_supabase_app/app/constants/supabase_const.dart';
import 'package:getx_supabase_app/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  Future<void> _signUp() async {
    isLoading.value = true;
    final isFormValid = formKey.currentState!.validate();

    if (!isFormValid) return;

    final email = emailController.text;
    final password = passwordController.text;
    final username = usernameController.text;

    final res = await supabase.auth
        .signUp(email, password, userMetadata: {'username': username});
    final error = res.error;

    isLoading.value = false;

    if (error != null) {
      Get.snackbar("Error", error.message);
      return;
    }

    Get.offNamed(Routes.CHAT);
  }

  void toLoginCallback() => Get.toNamed(Routes.LOGIN);

  void onRegisterCallback() => _signUp();
}
