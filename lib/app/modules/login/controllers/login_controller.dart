import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:halodoc/app/routes/app_pages.dart';

class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

//deklarasi auth

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  Future<void> Login(String email, String password) async {
    await FirebaseAuth.instance.signOut();
    try {
      await FirebaseAuth.instance.signOut();
      UserCredential myuser = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (myuser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        await FirebaseAuth.instance.signOut();
        Get.snackbar("Akun belum di verifikasi",
            "silahkan periksa email anda untuk melakukan verifikasi",
            snackPosition: SnackPosition.BOTTOM);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Email tidak ditemukan", "silahkan periksa kembali",
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Password anda salah", "silahkan periksa kembali",
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await FirebaseAuth.instance.signOut();
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.sendEmailVerification();
      Get.snackbar("Akun sudah berhasil dibuat",
          "Silahkan Check Email anda untuk mengkonfirmasi",
          snackPosition: SnackPosition.BOTTOM);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
            "Password minimal 6 angka", "silahkan masukan password lagi",
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Email sudah terdaftar", "silahkan masukan email lain",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> Reset(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.snackbar(
            "Berhasil", "Link Reset Password sudah kami kirim ke $email",
            snackPosition: SnackPosition.BOTTOM);
      } catch (e) {
        Get.snackbar("Reset password Gagal", "Chek Email anda kembali",
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar("Reset password Gagal", "Chek Email anda kembali",
          snackPosition: SnackPosition.BOTTOM);
    }
    ;
  }

  Future<void> Logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
