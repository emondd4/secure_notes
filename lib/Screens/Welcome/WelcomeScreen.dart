import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secure_notes/Screens/Welcome/WelcomeController.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  WelcomeController controller = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hello",
                  style: GoogleFonts.nunito(
                      fontStyle: FontStyle.normal,
                      fontSize: 36.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Obx(
                  () => controller.name.isNotEmpty
                      ? Text(
                          controller.name.value,
                          style: GoogleFonts.nunito(
                              fontStyle: FontStyle.normal,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        )
                      : Text(
                          "Loading",
                          style: GoogleFonts.nunito(
                              fontStyle: FontStyle.normal,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                ),
                Text(
                  "Welcome to Secure Notes!",
                  style: GoogleFonts.nunito(
                      fontStyle: FontStyle.normal,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.22,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Obx(() => controller.photo.isNotEmpty
                      ? CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.green,
                          child: CircleAvatar(
                            radius: 75,
                            backgroundImage:
                                NetworkImage(controller.photo.value),
                          ),
                        )
                      : const CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.green,
                          child: CircleAvatar(
                            radius: 75,
                            backgroundColor: Colors.lightGreen,
                          ),
                        )),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.22,
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      controller.gotoDashboard();
                    },
                    child: Container(
                      height: 41.0,
                      width: MediaQuery.sizeOf(context).width * 0.65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.orange),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: GoogleFonts.nunito(
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
