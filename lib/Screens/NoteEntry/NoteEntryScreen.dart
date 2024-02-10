import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secure_notes/Screens/NoteEntry/NoteEntryController.dart';

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
                  InkWell(onTap:() {
                    Get.back();
                  },child: const Icon(Icons.arrow_back_ios_new,size: 36,)),
                  const SizedBox(width: 15.0,),
                  Expanded(
                    child: Text(
                      "Note Details",
                      style: GoogleFonts.nunito(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                  InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.delete_outline,
                        size: 36,
                        color: Colors.orange,
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
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const TextField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: 'Input Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Note Description",
                  style: GoogleFonts.nunito(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const TextField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: 'Input Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                  maxLines: 10,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                      checkColor: Colors.orange,
                    ),
                    Text(
                      "Set Reminder",
                      style: GoogleFonts.nunito(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    Obx(() => controller.pickedDate.isEmpty
                        ? Container(
                            height: 41,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border:
                                    Border.all(width: 1, color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                15.0,
                                0.0,
                                15.0,
                                0.0,
                              ),
                              child: Center(
                                child: Text(
                                  "Pick Date & Time",
                                  style: GoogleFonts.nunito(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
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
                    },
                    child: Container(
                      height: 41.0,
                      width: MediaQuery.sizeOf(context).width * 0.65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.orange
                      ),
                      child: Center(child: Text("Save Note",style: GoogleFonts.nunito(fontStyle: FontStyle.normal,fontSize: 15.0, fontWeight: FontWeight.w700,color: Colors.black),)),
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
