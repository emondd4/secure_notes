import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:secure_notes/Utils/SecureStorage.dart';

class LoginController extends GetxController {

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      SecureStorage().writeSecureData("Name", userCredential.user?.displayName.toString() ?? "");
      SecureStorage().writeSecureData("Photo", userCredential.user?.photoURL.toString() ?? "");
      Get.offAndToNamed("/welcomePage",arguments: {"name":userCredential.user?.displayName.toString(),"photo":userCredential.user?.photoURL.toString()});
      // print(userCredential.user?.displayName.toString());
      // print(userCredential.user?.email.toString());
      // print(userCredential.user?.photoURL.toString());
    } on Exception catch (e) {
      print('exception->$e');
    }
  }

}