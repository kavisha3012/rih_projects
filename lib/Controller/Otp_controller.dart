import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_mvc_quizbook/Utils/api_common_class.dart';
import 'package:new_mvc_quizbook/Views/Appbar_Bottombar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/preferences.dart';
import '../Utils/shared_preference_helper.dart';
import '../Utils/utility.dart';
import '../Views/Signup_view.dart';

class OTPController extends GetxController {
  final TextEditingController otpController = TextEditingController();

  void sendOTP() {
    if (otpController.text.length == 4) {
      Get.to(() => SignUpScreen(mobileNumber: ''));
    }
  }
}
