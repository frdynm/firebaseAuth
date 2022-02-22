import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:halodoc/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var currentUser = FirebaseAuth.instance.currentUser;

  Future<void> Logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
