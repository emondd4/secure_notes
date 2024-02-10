import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_notes/Screens/Dashboard/DashboardController.dart';
import 'package:secure_notes/Utils/AppImages.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(71),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Secure Notes",
                    style: GoogleFonts.nunito(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Obx(() => controller.image.isNotEmpty
                      ? CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(controller.image.value),
                        )
                      : const CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.orange,
                          child: Center(
                            child: Text(
                              "P",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ))
                ],
              ),
            ),
          ),
        ),
        body: Obx(() => controller.noteList.value?.data?.data?.isEmpty == true ? Center(child: Lottie.asset(AppImages.instance.emptyAnim),) : ListView.builder(
          itemBuilder: (context, index) => noteItem(index),
          itemCount: controller.noteList.value?.data?.data?.length ?? 0,
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.gotoInputPage(null,null,null,false);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          backgroundColor: Colors.orange,
          child: const Icon(
            FontAwesomeIcons.add,
            size: 24.0,
          ),
        ),
      ),
    );
  }

  Widget noteItem(int index) {
    return InkWell(
      onTap: () {
        controller.gotoInputPage(controller.noteList.value?.data?.data?[index].id.toString(),controller.noteList.value?.data?.data?[index].title, controller.noteList.value?.data?.data?[index].description,true);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),color: Colors.white),
          child: Row(
            children: [
              Container(
                height: 123,
                width: 10,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0)),
                    gradient: LinearGradient(colors: [Colors.orange, Colors.red])),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: SizedBox(
                    height: 123,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    Text(
                      controller.noteList.value?.data?.data?[index].title ?? "Loading...",
                      style: GoogleFonts.nunito(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Text(
                      controller.noteList.value?.data?.data?[index].description ?? "Loading...",
                      style: GoogleFonts.nunito(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
                  )),
              Text(
                controller.getTime(controller.noteList.value?.data?.data?[index].updatedAt ?? "2024-02-10T15:13:31.000000Z"),
                style: GoogleFonts.nunito(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
