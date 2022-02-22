import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:halodoc/app/routes/app_pages.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  var isAuth = false.obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _account;
  UserCredential? userCredential;
//deklarasi auth

  Future<void> autoLogin() async {
    try {
      final isSignin = await _googleSignIn.isSignedIn();

      if (isSignin) {
        //ngechek isi dari get storage
        final box = GetStorage();
        final boxs = GetStorage();
        //jika is auth nya engga null sama is auth nya isinya true maka mengubah bolean is auth jadi true
        if (box.read('isauth') != null || box.read('isauth') == true) {
          isAuth.value = true;
        }
        if (boxs.read('loginEmail') != null ||
            boxs.read('loginEmail') == true) {
          isAuth.value = true;
        }
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> loginGoogle() async {
    try {
      //ini untuk handle kebocoran data sebelum login jadi di delete dulu
      await _googleSignIn.signOut();
      //jadi disini kita gunain method sign in lalu si file signin ini di kirim ke variable value lalu di push ke _account seperti variable diatas
      await _googleSignIn.signIn().then((value) => _account = value);

      //disin untuk dapat kondisi dia login atau engga typenya bolean
      final isSignin = await _googleSignIn.isSignedIn();

      if (isSignin) {
        //kondisi ketika si value nya ada isi
        print("Sudah berhasil login dengan akun");
        print(_account);

        final googleAuth = await _account!.authentication;

        //bikin dulu credential nah nanti di masukin ke Credential(nama variable googleauthnya)
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        //credential dipake buat di input ke firebase

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        print(userCredential);

        //menggunakan get storage untuk menyimpan data username dan password di hp
        final box = GetStorage();

        //untuk mengechek kalo data nya engga kosong nanti dia di hapus dulu langsung di isi ulang
        if (box.read('isauth') != null) {
          box.remove('isauth');
        }
        box.write('isauth', true);

        isAuth.value = true;
        Get.offAllNamed(Routes.HOME);
      } else {
        //jika gagal login guys
        print("Gagal Login");
      }
      ;
    } catch (errorCode) {
      print(errorCode);
      print("Gagal Login");
    }
  }

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  Future<void> Login(String email, String password) async {
    await FirebaseAuth.instance.signOut();
    try {
      await FirebaseAuth.instance.signOut();
      UserCredential myuser = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (myuser.user!.emailVerified) {
        final username = GetStorage();

        if (username.read('username') != null) {
          username.remove('isauth');
        }
        username.write('username', true);
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
}
