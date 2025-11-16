import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  RxnString userId = RxnString();
  RxBool isLoading = RxBool(false);

  Future<String> signin(String email, String password) async {
    isLoading(true);
    try {
      final cred = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      if(cred.user != null) {
        userId.value = cred.user!.uid;
        return "success";
      }else{
        return "Something went wrong";
      }
    } catch (e) {
      return e.toString();
    } finally {
      isLoading(false);
    }
  }

  Future<String> signinWithGoogle() async {
    isLoading(true);
    try {
      final google = GoogleSignIn.instance;

      google.authenticate();

      return "success";
    } catch (e) {
      return e.toString();
    } finally {
      isLoading(false);
    }
  }


}
