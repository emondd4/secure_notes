import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secure_notes/Screens/Login/LoginController.dart';
import 'package:secure_notes/Utils/AppImages.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginController controller = Get.put(LoginController());

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
                Text("Welcome To Secure Notes",style: GoogleFonts.nunito(fontStyle: FontStyle.normal,fontSize: 36.0, fontWeight: FontWeight.w700,color: Colors.black),),
                Text("Please Sign In With Your Google Account",style: GoogleFonts.nunito(fontStyle: FontStyle.normal,fontSize: 15.0, fontWeight: FontWeight.w500,color: Colors.black),),
                SvgPicture.asset(AppImages.instance.loginSvg,height: MediaQuery.sizeOf(context).height * 0.5,),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.06,),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      controller.signInWithGoogle();
                    },
                    child: Container(
                      height: 41.0,
                      width: MediaQuery.sizeOf(context).width * 0.65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.orange
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(FontAwesomeIcons.google,size: 16.0,),
                          const SizedBox(width: 20.0,),
                          Text("Sign In with Google",style: GoogleFonts.nunito(fontStyle: FontStyle.normal,fontSize: 15.0, fontWeight: FontWeight.w500,color: Colors.black),),
                        ],
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
