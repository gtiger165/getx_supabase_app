import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_supabase_app/app/constants/widget_const.dart';
import 'package:getx_supabase_app/app/widgets/textfield_widget.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: ListView(
        padding: formPadding,
        children: [
          TextFieldWidget(
            controller: controller.emailController,
            label: "Email",
            inputType: TextInputType.emailAddress,
          ),
          formSpacer,
          TextFieldWidget(
            controller: controller.passwordController,
            label: "Password",
            isObscure: true,
          ),
          formSpacer,
          Obx(
            () => ElevatedButton(
              onPressed: controller.isLoading.value
                  ? null
                  : controller.onLoginCallback,
              child: const Text('Log In'),
            ),
          ),
        ],
      ),
    );
  }
}
