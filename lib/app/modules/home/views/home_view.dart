import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    //bikin variable untuk menampung data firebase
    final nama = controller.currentUser!.displayName;
    return Scaffold(
        body: SafeArea(
      maintainBottomViewPadding: true,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halo " + nama.toString(),
              style:
                  GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            Row(
              children: [
                Text(
                  "Find ",
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w300),
                ),
                Text(
                  "Your Doctor",
                  style: GoogleFonts.roboto(fontSize: 20, color: Colors.grey),
                ),
                SizedBox(
                  width: 150,
                ),
                IconButton(
                    onPressed: () {
                      controller.Logout();
                    },
                    icon: Icon(Icons.logout_outlined))
              ],
            ),
            // Search ar
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                iconColor: Colors.black,
                focusColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                hintText: "Search doctor, medicinines etc",
                suffixIcon: Icon(Icons.search),
                suffixIconColor: Colors.black,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.27,
              child: GridView.count(
                crossAxisCount: 4,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          print("Tombol konsultasi si klik");
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            child: Icon(
                              Icons.call,
                              size: 40,
                              color: Colors.white,
                            ),
                            color: Colors.blue[400],
                            width: 56,
                            height: 56,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Konsultasi")
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          print("Tombol konsultasi Gigi");
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            child: Icon(
                              Icons.document_scanner_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                            color: Colors.purple[400],
                            width: 56,
                            height: 56,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Gigi")
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          print("Tombol konsultasi si penyakit dalam di klik");
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            child: Icon(
                              Icons.ac_unit,
                              size: 40,
                              color: Colors.white,
                            ),
                            color: Colors.orange[800],
                            width: 56,
                            height: 56,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("P.Dalam")
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          print("Rumah sakit Di klik");
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            child: Icon(
                              Icons.local_hospital,
                              size: 40,
                              color: Colors.white,
                            ),
                            color: Colors.deepOrangeAccent,
                            width: 56,
                            height: 56,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Rumkit")
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          print("Tombol Obat Di klik");
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            child: Icon(
                              Icons.medication,
                              size: 40,
                              color: Colors.white,
                            ),
                            color: Colors.green,
                            width: 56,
                            height: 56,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Obat")
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          print("Tombol konsultasi si klik");
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            child: Icon(
                              Icons.health_and_safety,
                              size: 40,
                              color: Colors.white,
                            ),
                            color: Colors.blueGrey,
                            width: 56,
                            height: 56,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Kejiwaan")
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          print("Tombol konsultasi Kulit");
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            child: Icon(
                              Icons.sports_kabaddi_rounded,
                              size: 40,
                              color: Colors.white,
                            ),
                            color: Colors.redAccent,
                            width: 56,
                            height: 56,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Kulit")
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          print("Tombol Info Vaksin");
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            child: Icon(
                              Icons.medical_services_rounded,
                              size: 40,
                              color: Colors.white,
                            ),
                            color: Colors.red,
                            width: 56,
                            height: 56,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Vaksin")
                    ],
                  ),
                ],
              ),
            ),
            // Top Doctor and View Alls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Doctors",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      print("View All Di klik");
                    },
                    child: Text("View all"))
              ],
            ),
            // listView
            Container(
              height: Get.height * 0.39,
              width: Get.width,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: Get.height * 0.15,
                              width: Get.width * 0.24,
                              color: Colors.grey,
                              child: Image.network(
                                  "https://toppng.com/uploads/preview/animasi-dokter-11550724726d3r6trxnwi.png"),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              height: Get.height * 0.15,
                              width: Get.width * 0.68,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dr ke $index",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Spesialis ",
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                        ),
                                        Icon(
                                          Icons.api_rounded,
                                          size: 12,
                                        ),
                                        Text(
                                          " Persahabatan Hospital",
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height: 35,
                                            width: 80,
                                            color: Colors.green[100],
                                            child: Center(
                                              child: Text(
                                                "Open",
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
