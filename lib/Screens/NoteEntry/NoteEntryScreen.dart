import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secure_notes/Screens/NoteEntry/NoteEntryController.dart';

import '../../Utils/AppColors.dart';

class NoteEntryScreen extends StatelessWidget {
  NoteEntryScreen({super.key});

  final NoteEntryController controller = Get.put(NoteEntryController());

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
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 36,
                        color: AppColors.instance.appPrimacyColor,
                      )),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Text(
                      "Note Details",
                      style: GoogleFonts.nunito(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w700,
                          color: AppColors.instance.appPrimacyColor),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        controller.deleteNote();
                      },
                      child: const Icon(
                        Icons.delete_outline,
                        size: 36,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Note Title",
                  style: GoogleFonts.nunito(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.instance.appPrimacyColor),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: 'Input Title',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(
                        color: AppColors.instance.appSecondaryColor,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(
                        color: AppColors.instance.appSecondaryColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                  controller: controller.titleController,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Note Description",
                  style: GoogleFonts.nunito(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.instance.appPrimacyColor),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: 'Input Description',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(
                        color: AppColors.instance.appSecondaryColor,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(
                        color: AppColors.instance.appSecondaryColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                  maxLines: 10,
                  controller: controller.descController,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Obx(() => Checkbox(
                          value: controller.selected.value,
                          onChanged: (value) {
                            controller.selected.value = value!;
                          },
                          checkColor: AppColors.instance.appPrimacyColor,
                          activeColor: AppColors.instance.appSecondaryColor,
                          side: BorderSide(color: AppColors.instance.appPrimacyColor),
                        )),
                    Text(
                      "Set Reminder",
                      style: GoogleFonts.nunito(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: AppColors.instance.appSecondaryColor),
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    Obx(() => controller.pickedDate.isEmpty
                        ? InkWell(
                            onTap: () {
                              controller.datePick();
                            },
                            child: Container(
                              height: 41,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      width: 1, color: AppColors.instance.appSecondaryColor)),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  15.0,
                                  0.0,
                                  15.0,
                                  0.0,
                                ),
                                child: Center(
                                  child: Obx(() =>
                                      controller.selectedTimeDate.value.isEmpty
                                          ? Text(
                                              "Pick Date & Time",
                                              style: GoogleFonts.nunito(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.instance.appSecondaryColor),
                                            )
                                          : Text(
                                              controller.selectedTimeDate.value,
                                              style: GoogleFonts.nunito(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.instance.appSecondaryColor),
                                            )),
                                ),
                              ),
                            ),
                          )
                        : Text(
                            controller.pickedDate.value,
                            style: GoogleFonts.nunito(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          )),
                  ],
                ),
                const SizedBox(
                  height: 60.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      if (controller.flag) {
                        controller.updateNote();
                      } else {
                        controller.createNote();
                      }
                    },
                    child: Container(
                      height: 41.0,
                      width: MediaQuery.sizeOf(context).width * 0.65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColors.instance.appPrimacyColor),
                      child: Center(
                          child: Text(
                        "Save Note",
                        style: GoogleFonts.nunito(
                            fontStyle: FontStyle.normal,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.instance.appLightColor),
                      )),
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
