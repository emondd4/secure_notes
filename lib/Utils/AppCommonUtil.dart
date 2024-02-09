import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CommonUtil {

  static CommonUtil instance = CommonUtil();

  /// Device
  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getScreenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  /// Input
  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  /// Internet Check
  Future<bool> internetCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      debugPrint("No Internet");
      return false;
    }
    return true;
  }


  /// Handle Over-tapping
  DateTime? initialClickTime;

  bool isRedundantClick(DateTime currentTime, int redundantClickDuration) {
    if (initialClickTime == null) {
      initialClickTime = currentTime;
      return false;
    } else {
      if (currentTime
          .difference(initialClickTime!)
          .inSeconds < redundantClickDuration) { //set this difference time in seconds (ideally 3 sec)
        return true;
      }
    }
    initialClickTime = currentTime;
    return false;
  }

}