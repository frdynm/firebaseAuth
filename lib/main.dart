import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:halodoc/app/modules/home/views/home_view.dart';
import 'package:halodoc/app/modules/login/controllers/login_controller.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginC = Get.put(LoginController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: LoginC.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print(snapshot.data);
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Application",
              initialRoute:
                  snapshot.data != null && snapshot.data!.emailVerified == true
                      ? Routes.HOME
                      : Routes.LOGIN,
              getPages: AppPages.routes,
            );
          }
          return FutureBuilder(
            future: LoginC.autoLogin(),
            builder: (context, snapshot) => HomeView(),
          );
        });
  }
}
