import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icaleg/infrastructure/navigation/routes.dart';
import 'package:icaleg/infrastructure/theme/theme_utils.dart';
import 'package:icaleg/presentation/login/controllers/login.controller.dart';
import 'package:ionicons/ionicons.dart';

class LoginFromView extends GetView {
  LoginFromView({Key? key}) : super(key: key);

  @override
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(27),
          boxShadow: [boxShadow]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Selamat Datang!',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 6),
        const Text('Silahkan masuk terlebih dahulu'),
        const SizedBox(height: 28),
        Form(
          key: controller.formKey,
          child: Column(
            children: [
              _textFromFiled(
                controller: controller.emailTextEditingController,
                labelText: 'E-mail',
                prefixIcon: Icon(
                  Ionicons.mail_outline,
                  color: Colors.grey.shade600,
                ),
                validator: (val) => controller.textInputValidatorController
                    .validatorIdentifier(val),
              ),
              const SizedBox(height: 20),
              Obx(
                () => _textFromFiled(
                  controller: controller.passwordTextEditingController,
                  textInputAction: TextInputAction.go,
                  obscureText: !controller.showPassowrd.value,
                  labelText: 'Password',
                  prefixIcon: Icon(
                    Ionicons.key_outline,
                    color: Colors.grey.shade600,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => controller.showPassowrd.toggle(),
                    icon: (controller.showPassowrd.value)
                        ? Icon(Ionicons.eye_outline,
                            color: Colors.grey.shade600)
                        : Icon(Ionicons.eye_off_outline,
                            color: Colors.grey.shade600),
                  ),
                  validator: (val) => controller.textInputValidatorController
                      .validatorPassword(val),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
              onPressed: () => Get.toNamed(Routes.FORGET_PASSWORD),
              child: const Text('Lupa Password')),
        ),
        SizedBox(
            width: Get.width,
            child:
                ElevatedButton(onPressed: () {}, child: const Text('Masuk'))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.width / 2 - (64),
              child: const Divider(thickness: 1),
            ),
            const Text(
              ' atau ',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              width: Get.width / 2 - (64),
              child: const Divider(thickness: 1),
            ),
          ],
        ),
        SizedBox(
            width: Get.width,
            child: OutlinedButton(
                onPressed: () => Get.toNamed(Routes.REGISTRY),
                child: const Text('Daftar')))
      ]),
    );
  }

  TextFormField _textFromFiled({
    required TextEditingController controller,
    required String labelText,
    required Icon prefixIcon,
    TextInputAction textInputAction = TextInputAction.next,
    bool obscureText = false,
    Widget? suffixIcon,
    required Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureText,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: Colors.white70,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(),
        ),
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade600),
      ),
      validator: (value) => validator(value),
    );
  }
}
