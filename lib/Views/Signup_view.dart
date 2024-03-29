// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print, file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_mvc_quizbook/Controller/Image_Upload_controller.dart';
import 'package:new_mvc_quizbook/Views/Appbar_Bottombar_view.dart';
import '../Controller/Signup_controller.dart';
import '../Utils/constants.dart';
import '../Utils/utility.dart';
import '../Widgets/common_appbar.dart';
import '../Widgets/common_button.dart';
import '../Widgets/common_textfield.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen(
      {super.key, required this.mobileNumber, this.isBackArrow = false});

  final _key = GlobalKey<FormState>();

  final bool isBackArrow;

  final String mobileNumber;

  final SignUpController _controller = Get.put(SignUpController());

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _mobileController = TextEditingController();

  final PhotoController photoController = Get.put(PhotoController());

  final RxString selectedGender = ''.obs;

  final RxString selectedDesignation = ''.obs;

  final RxString genderErrorMessage = RxString('');

  final RxString desErrorMsg = RxString('');

  @override
  Widget build(BuildContext context) {
    _mobileController.text = mobileNumber;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CommonAppBarScreen(
          title: 'Update Profile',
          backgroundColor: whiteColor, // Customize the color here
          centerTitle: true,
          isBackArrow: true,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    GestureDetector(
                      onTap: photoController.pickImage,
                      child: Obx(() {
                        return (photoController.selectedImage.value == null)
                            ? CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey,
                                child: Image.asset(changeProfile),
                              )
                            : CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(
                                    photoController.selectedImage.value!),
                              );
                      }),
                    ),
                    CommonTextFormField(
                      autoFocus: true,
                      controller: _firstNameController,
                      label: 'First Name',
                      errorMessage: 'Enter Your First Name',
                      inputType: TextInputType.text,
                      formatter: [],
                      length: 60,
                      onTap: () {},
                    ),
                    CommonTextFormField(
                      controller: _lastNameController,
                      label: 'Last Name',
                      errorMessage: 'Enter Your Last Name',
                      inputType: TextInputType.text,
                      formatter: [],
                      length: 60,
                      onTap: () {},
                    ),
                    CommonTextFormField(
                      controller: _emailController,
                      label: 'Email ID',
                      errorMessage: 'Please enter valid Email Id',
                      inputType: TextInputType.text,
                      formatter: [],
                      length: 60,
                      onTap: () {},
                      isEmailField: true,
                    ),
                    CommonTextFormField(
                      controller: _mobileController,
                      label: 'Mobile Number',
                      errorMessage: 'Please enter valid Number',
                      inputType: TextInputType.number,
                      formatter: [mobileLengthFormatter, mobileNumberFormater],
                      length: 10,
                      onTap: () {},
                      isMobileNumber: true,
                      isReadOnly: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                            width: (MediaQuery.of(context).size.width / 2 - 10),
                            child: Flexible(
                              child: Obx(
                                () => DropdownButtonFormField<String>(
                                  value: selectedGender.value.isEmpty
                                      ? null
                                      : selectedGender.value,
                                  decoration: const InputDecoration(
                                      labelText: 'Gender',
                                      labelStyle: TextStyle(
                                          color: greyColor, fontSize: 14)
                                      // Add other styling properties here if needed
                                      ),
                                  hint: const Text(
                                    "Select gender",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  onChanged: (value) {
                                    selectedGender(value);
                                    genderErrorMessage('');
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please select a gender";
                                    }
                                    return null;
                                  },
                                  items: ['Male', 'Female', 'Other']
                                      .map<DropdownMenuItem<String>>(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style:
                                                const TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Obx(() {
                          if (genderErrorMessage.value.isNotEmpty) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text(
                                genderErrorMessage.value,
                                style: const TextStyle(
                                    color: redColor, fontSize: 13),
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        }),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Expanded(
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: InkWell(
                                  onTap: () {
                                    Utility.showDatePickerDialog()
                                        .then((pickedDate) {
                                      if (pickedDate != null) {
                                        _controller.chnageBirthDate(
                                            "${pickedDate.toLocal()}"
                                                .split(' ')[0]);
                                        print('2');
                                      }
                                    });
                                  },
                                  child: InputDecorator(
                                      decoration: const InputDecoration(
                                          labelText: 'BirthDate',
                                          labelStyle: TextStyle(
                                              color: greyColor, fontSize: 14)),
                                      child: Obx(() => Text(
                                            _controller.selectedBirthDate.value,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                overflow: TextOverflow.clip),
                                          ))),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1,
                      child: Obx(
                        () => DropdownButtonFormField<String>(
                          padding: EdgeInsets.zero,
                          value: selectedDesignation.value.isEmpty
                              ? null
                              : selectedDesignation.value,
                          decoration: const InputDecoration(
                              labelText: 'Select Designation',
                              labelStyle:
                                  TextStyle(color: greyColor, fontSize: 14)
                              // Add other styling properties here if needed
                              ),
                          onChanged: (value) {
                            selectedDesignation(value);
                            desErrorMsg('');
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Select ";
                            }
                            return null;
                          },
                          items: ["Teacher", "Engineer", "Principal"]
                              .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    Obx(() {
                      if (desErrorMsg.value.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            desErrorMsg.value,
                            style:
                                const TextStyle(color: redColor, fontSize: 13),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CommonButton(
          onPress: () async {
            if (_key.currentState!.validate()) {
              //  _controller.verifyOtp();
              if (_controller.selectedBirthDate.value == 'Select Date') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please select date',
                        style: TextStyle(fontSize: 15)),
                    duration: Duration(seconds: 2),
                  ),
                );
              } else {
                Get.offAll(AppbarBottomBarScreen());
              }
            }
          },
          title: 'Updatde'),
    );
  }
}
