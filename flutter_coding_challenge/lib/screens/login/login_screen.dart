import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/core/firebase_auth_service/firebase_auth_controller.dart';
import 'package:flutter_coding_challenge/screens/registration/registration_screen.dart';
import 'package:get/get.dart';

class LoginPage extends GetWidget<AuthController> {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller
              .login(
                  email: emailController.value.text.trim(),
                  password: passwordController.value.text.trim())
              .catchError((onError) {
            Get.snackbar(
                'LoginPage Error', "looks like this went wrong :\n$onError");
          });
        },
        child: const Text("Login"),
      ),
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
            TextButton(
              onPressed: () {
                Get.to(RegistrationPage());
              },
              child: const Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}
