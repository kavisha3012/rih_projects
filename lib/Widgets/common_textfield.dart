import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Utils/constants.dart';
import '../Utils/utility.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String prefixIcon;
  final bool textInputAction;
  final String suffixIcon;
  final String label;
  final String errorMessage;
  final TextInputType inputType;
  final int length;
  final bool isDropDown;
  final bool isReadOnly;
  final VoidCallback onTap;
  final bool isEmailField;
  final bool initialValue;
  final bool autoFocus;
  final bool isOTPField;

  final List<TextInputFormatter> formatter;
  final bool isMobileNumber;

  CommonTextFormField({
    super.key,
    required this.controller,
    required this.errorMessage,
    this.hint = '',
    this.prefixIcon = '',
    this.suffixIcon = '',
    required this.label,
    required this.inputType,
    required this.formatter,
    this.length = 500,
    this.isDropDown = false,
    required this.onTap,
    this.textInputAction = true,
    this.isMobileNumber = false,
    this.isEmailField = false,
    this.isReadOnly = false,
    this.initialValue = false,
    this.autoFocus = false,
    this.isOTPField = false,
  });

  final TextStyle labelStyle = TextStyle(
    fontSize: 14,
    color: greyColor,
    fontWeight: FontWeight.w500,
  );
  final TextStyle hintStyle = TextStyle(
    fontSize: 14,
    color: greyColor,
    fontWeight: FontWeight.w500,
  );
  final TextStyle textStyle = TextStyle(
    fontSize: 14,
    color: blackColor,
    fontWeight: FontWeight.w500,
  );

  final TextStyle mobileNumberStyle = TextStyle(
    fontSize: 15,
    color: blackColor,
    fontWeight: FontWeight.w500,
  );

  final InputBorder border = UnderlineInputBorder(
      borderSide: const BorderSide(color: greyColor, width: 0.0));

  final InputBorder focusBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: purpleColor, width: 0.0));

  final InputBorder errorBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: redColor, width: 0.0));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      onTap: onTap,
      readOnly: isReadOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: mobileNumberStyle,
      keyboardType: inputType,
      inputFormatters: formatter,
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          counterText: '',
          isDense: false,
          hintText: hint,
          hintStyle: hintStyle,
          label: Text(
            label,
            style: labelStyle,
          ),
          errorBorder: errorBorder,
          focusedBorder: focusBorder,
          border: border,
          disabledBorder: border,
          focusedErrorBorder: errorBorder,
          enabledBorder: border,
          prefix: isMobileNumber
              ? Text('+91', style: mobileNumberStyle)
              : SizedBox.shrink(),

          suffix: isDropDown
              ? Image.asset(
                  suffixIcon,
                  width: 10,
                  height: 10,
                )
              : SizedBox.shrink()),
      validator: (newVal) {
        print(newVal);
        if (isMobileNumber) {
          if (newVal!.isEmpty || newVal!.length < 10) {
            return errorMessage;
          }
        } else if (isEmailField) {
          if (newVal!.isEmpty || !Utility.isEmailValid(newVal)) {
            return errorMessage;
          } else {
            print('email is valid');
          }
        } else if (isOTPField) {
          if (newVal!.isEmpty || newVal!.length < 4) {
            return errorMessage;
          } else {
            print('OTP is valid');
          }
        } else {
          if (newVal!.isEmpty) {
            return errorMessage;
          }
        }

        return null;
      },
    );
  }
}
