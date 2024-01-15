import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Utils/constants.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class CongratulationScreen extends StatelessWidget {
  CongratulationScreen({super.key});

  final TextStyle commonTextStyle = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: Center(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Image.asset(trophyImage, scale: 3.5),
              SizedBox(
                height: 20,
              ),
              Text(
                'Congratulation',
                style: commonTextStyle,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'You have completed successfully.',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: resultTrueColor,
                      ),
                      child: Text(
                        '10 correct  ',
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: resultFalseColor,
                      ),
                      child: Text('5 Incorrect  ')),
                ],
              ),
              // CommonButton(
              //   onPress: () {},
              //   title: 'View the result',
              // ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: 1200,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(whiteColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: whiteColor)))),
                      onPressed: () {},
                      child: Text(
                        'View the result',
                        style: TextStyle(color: purpleColor),
                      ))),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: 1200,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(purpleColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: whiteColor)))),
                      onPressed: () {},
                      child: Text(
                        'Start a new quiz',
                        style: TextStyle(color: whiteColor),
                      ))),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  // Handle the click event here.
                  print('Text clicked!');
                },
                child: Text(
                  'Give Feedback',
                  style: TextStyle(
                    color: whiteColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
