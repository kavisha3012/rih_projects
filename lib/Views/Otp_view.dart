import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_mvc_quizbook/Views/Signup_view.dart';
import '../Controller/Otp_controller.dart';
import '../Utils/constants.dart';
import '../Widgets/common_appbar.dart';
import '../Widgets/common_button.dart';
import '../Widgets/common_textfield.dart';

class OTPScreen extends StatelessWidget {
  final OTPController _controller = Get.put(OTPController());
  final _key = GlobalKey<FormState>();
  final String mobile;
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  OTPScreen({super.key, required this.mobile});

  @override
  Widget build(BuildContext context) {
    _mobileController.text = mobile;
    print('mobile ====${mobile}');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CommonAppBarScreen(
          title: 'OTP Vefification',
          backgroundColor: whiteColor, // Customize the color here
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Please enter the 4-digit OTP sent to your phone.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Container(
                width: 200,
                child: Form(
                  key: _key,
                  child: CommonTextFormField(
                    controller: _otpController, // Store text ,_ : private
                    errorMessage: 'Enter Your OTP',
                    inputType: TextInputType.number,
                    label: 'Enter OTP',
                    formatter: [otpFormatter, mobileNumberFormater],
                    onTap: () {},
                    isOTPField: true,
                    autoFocus: true,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CommonButton(
                  // onPress: () async {
                  //   if (_key.currentState!.validate()) {
                  //     Map<String, dynamic> body = {
                  //       'mobileNumber': _mobileController.text,
                  //       'OTP': _otpController.text
                  //     };
                  //     _controller.verifyOtpApi(body);
                  //   }
                  // },

                  onPress: () async {
                    if (_key.currentState!.validate()) {
                      print('mobile number =======> ${mobile}');
                      Get.to(() => SignUpScreen(
                            mobileNumber: mobile,
                          ));
                    }
                  },
                  title: 'Send OTP')
            ],
          ),
        ),
      ),
    );
  }
}
