import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog({Key? key,required this.title,required this.message, required this.image}) : super(key: key);

  String title;
  String message;
  String image;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: AspectRatio(
        aspectRatio: 1.1,
        child: Padding(
            padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Lottie.asset(image,height: 64.0,width: 64.0),
              const SizedBox(height: 40.0,),
              Text(title,style: GoogleFonts.nunito(fontStyle: FontStyle.normal,fontSize: 15.0, fontWeight: FontWeight.w500,color: Colors.black),),
              const SizedBox(height: 15.0,),
              Text(message,style: GoogleFonts.nunito(fontStyle: FontStyle.normal,fontSize: 13.0, fontWeight: FontWeight.w400,color: Colors.black),),
              const SizedBox(height: 30.0,),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.orange
                  ),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: Text("Dismiss",style: GoogleFonts.nunito(fontStyle: FontStyle.normal,fontSize: 15.0, fontWeight: FontWeight.w500,color: Colors.black),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
