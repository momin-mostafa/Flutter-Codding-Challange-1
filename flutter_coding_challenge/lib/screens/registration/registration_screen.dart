import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/core/firebase_auth_service/firebase_auth_controller.dart';
import 'package:get/get.dart';

class RegistrationPage extends GetWidget<AuthController> {
  RegistrationPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
            ),
            TextFormField(
              controller: passwordController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.createUser(
                    email: emailController.value.text.trim(),
                    password: passwordController.value.text.trim());
              },
              child: const Text("Sign Up"),
            )
          ],
        ),
      ),
    );
  }
}
