import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_mvc_quizbook/Utils/constants.dart';
import 'package:new_mvc_quizbook/Views/Otp_view.dart';
import 'package:new_mvc_quizbook/Widgets/common_button.dart';

import '../Widgets/common_textfield.dart';

class LoginScreen extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  // final OTPController _controller = Get.put(OTPController());
  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Center(
                child: Image.asset(bgImage),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    SizedBox(
                        height: 90, width: 120, child: Image.asset(imgLogo)),
                    SizedBox(
                        height: 130, width: 220, child: Image.asset(quizBook)),
                    SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: _key,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: CommonTextFormField(
                          autoFocus: true,
                          hint: 'Enter Your Mobile Number',
                          controller: _mobileController,
                          label: 'Mobile Number',
                          errorMessage: 'Please enter valid Number',
                          inputType: TextInputType.number,
                          formatter: [
                            mobileNumberFormater,
                            mobileLengthFormatter
                          ],
                          onTap: () {},
                          isMobileNumber: true,
                          // isReadOnly: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CommonButton(
            onPress: () async {
              if (_key.currentState!.validate()) {
                final data = _mobileController.text;
                print(data);
                // _controller.verifyOtp();
                Get.to(() => OTPScreen(
                      mobile: data,
                    ));
              }
            },
            title: 'Send OTP'));
  }
}





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../Utils/constants.dart';
// import '../Widgets/common_button.dart';
// import '../Widgets/common_textfield.dart';
// import 'Otp_view.dart';

// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});

//   final _key = GlobalKey<FormState>();
//   // final OTPController _controller = Get.put(OTPController());
//   final TextEditingController _mobileController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//           children: [
//             SizedBox(
//               height: 200,
//               child: Stack(
//                 children: [
//                   Positioned(
//                       left: 0,
//                       right: 0,
//                       child: Image.asset(bgImage, fit: BoxFit.fill)),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Image.asset(
//                       imgLogo,
//                       height: 100,
//                       width: 100,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Form(
//               key: _key,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: CommonTextFormField(
//                   autoFocus: true,
//                   hint: 'Enter Your Mobile Number',
//                   controller: _mobileController,
//                   label: 'Mobile Number',
//                   errorMessage: 'Please enter valid Number',
//                   inputType: TextInputType.number,
//                   formatter: [mobileNumberFormater, mobileLengthFormatter],
//                   onTap: () {},
//                   isMobileNumber: true,
//                   // isReadOnly: false,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         bottomNavigationBar: CommonButton(
//             onPress: () async {
//               if (_key.currentState!.validate()) {
//                 final data = _mobileController.text;
//                 print(data);
//                 // _controller.verifyOtp();
//                 Get.to(() => OTPScreen(
//                       mobile: data,
//                     ));
//               }
//             },
//             title: 'Send OTP'));
//   }
// }
