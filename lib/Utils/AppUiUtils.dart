import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_notes/Utils/AppImages.dart';
import 'package:secure_notes/Widgets/CustomDialog.dart';


class UIUtil {

  static UIUtil instance = UIUtil();

  /// Show Toast
  showToast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg),duration: const Duration(seconds: 3),));
  }

  dismissToast(BuildContext context) {
    try {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void errorToast(BuildContext context, String msg, String buttonText, Function()? call) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          label: buttonText,
          textColor: Colors.white,
          onPressed:() => (call==null) ? dismissToast(context) : call,
        ),
      ),
    );
  }

  /// Loader Behavior
  Future<void> showLoading() {
    return showDialog(
        context: Get.context!,
        builder: (context) {
          return Center(
              child: Image.asset(AppImages.instance.splashAnim, height: 100, width: 100));
        },
        barrierLabel: '');
  }

  void stopLoading() {
    Get.back();
  }

  void onNoInternet() {

    Get.dialog(CustomDialog(title: "No Internet!", message: "Please Check Your Connectivity!", image: AppImages.instance.noInternetAnim));

  }

  void onFailed(String failedMsg) {
    Get.dialog(CustomDialog(title: "No Internet!", message: "Please Check Your Connectivity!", image: AppImages.instance.noInternetAnim));
  }


}