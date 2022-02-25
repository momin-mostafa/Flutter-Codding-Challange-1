import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> user = Rxn<User>();

  String? get getUser => user.value?.email;

  @override
  void onInit() {
    user.bindStream(_auth.authStateChanges());
  }

  void createUser({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
          'Creating user failed in AuthController', 'Oops ! Got an Error : $e');
    }
  }

  void login({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('Login Failed ', 'Oops ! Login Failed : $e');
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar('Signout AuthController', 'Oops ! Got an Signing out : $e');
    }
  }
}
