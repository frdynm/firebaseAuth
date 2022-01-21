import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:halodoc/app/modules/login/controllers/login_controller.dart';

import 'login_view.dart';

class ResetpasswordView extends GetView {
  final ResetP = Get.put(LoginController());
  final TextEditingController emailR = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Image.network(
            "https://www.clipartmax.com/png/full/136-1366554_health-sign-blue-icon-doctor-consultation-icon.png",
            width: Get.width,
            height: Get.height * 0.20,
          ),
          SizedBox(height: 50),
          Text(
            "Reset Password",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: emailR,
            decoration: InputDecoration(
                // focusedborder == ketika di klik nanti mau di apain si outline nya
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1.0)),
                labelStyle: TextStyle(color: Colors.black),
                hintText: "Admin@gmail.com",
                suffixIcon: Icon(
                  Icons.mail_outline_rounded,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
          SizedBox(height: 20),
          Container(
            height: 60,
            width: Get.width,
            child: ElevatedButton(
              child: Text(
                "Reset",
                style: TextStyle(fontSize: 30),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                print("Reset password");
                ResetP.Reset(emailR.text);
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Akun sudah dibuat ",
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(
                  onPressed: () {
                    Get.to(LoginView());
                  },
                  child: Text(
                    "Login disini",
                    style: TextStyle(color: Colors.lightBlue),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
