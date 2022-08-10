import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_supabase_app/app/constants/widget_const.dart';
import 'package:getx_supabase_app/app/widgets/textfield_widget.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: formPadding,
          children: [
            TextFieldWidget(
              controller: controller.emailController,
              label: 'Email',
              inputType: TextInputType.emailAddress,
            ),
            formSpacer,
            TextFieldWidget(
              controller: controller.passwordController,
              label: 'Password',
              isObscure: true,
              additionalValidator: (val) {
                if (val.length < 6) {
                  return '6 characters minimum';
                }
                return null;
              },
            ),
            formSpacer,
            TextFieldWidget(
              controller: controller.usernameController,
              label: 'Username',
              additionalValidator: (val) {
                final isValid = RegExp(r'^[A-Za-z0-9_]{3,24}$').hasMatch(val);

                if (!isValid)
                  return '3-24 long with alphanumeric or underscore';

                return null;
              },
            ),
            formSpacer,
            Obx(
              () => ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : controller.onRegisterCallback,
                child: const Text('Register'),
              ),
            ),
            formSpacer,
            TextButton(
              onPressed: controller.toLoginCallback,
              child: const Text('I already have an account'),
            ),
          ],
        ),
      ),
    );
  }
}
