// ignore_for_file: prefer_const_constructors, avoid_print, empty_catches, file_names

import 'package:get/get.dart';
import '../Models/Question_model.dart';
import '../Views/Congratulation_view.dart';

class QuestionController extends GetxController {
  RxInt currentQuestionIndex = 1.obs;
  RxList<QuestionModel> questions = <QuestionModel>[
    QuestionModel(
      question:
          'Lassi paratha and mixed vegetables are staple food of which states?',
      options: ['A: Gujarat', 'B: Maharashtra', 'C: Rajasthan', 'D: Punjab'],
      trueAnswer: 3,
    ),
    QuestionModel(
      question: 'Second Question',
      options: ['A: Option A', 'B: Option B', 'C: Option C', 'D: Option D'],
      trueAnswer: 0,
    ),
    QuestionModel(
      question: 'Third Question',
      options: ['A: abc', 'B: def', 'C: jkl', 'D: xyz'],
      trueAnswer: 2,
    ),
    QuestionModel(
      question: 'Forth Question',
      options: ['A: Apple', 'B: Banana', 'C: Mango', 'D: Orange'],
      trueAnswer: 3,
    ),
  ].obs;

  RxInt selectedOptionIndex = (-1).obs;

  void moveToNextQuestion() {
    if (currentQuestionIndex < questions.length) {
      currentQuestionIndex++;
      selectedOptionIndex.value =
          -1; // Reset selected option for the new question
      print('aaaaa');
    } else {
      Get.to(CongratulationScreen());
    }
  }

  // bool isOptionCorrect(int index) {
  //   return index == getCorrectOptionIndex();
  // }

  // void checkAnswer(int selectedOptionIndex) {
  //   this.selectedOptionIndex.value = selectedOptionIndex;

  //   Future.delayed(Duration(seconds: 2), () {
  //     moveToNextQuestion();
  //   });
  // }

  // int getCorrectOptionIndex() {
  //   return questions[currentQuestionIndex.value - 1].trueAnswer;
  // }

  // Future<void> questionApi(Map<String, dynamic> body) async {
  //   try {
  //     var response = await ApiController.commonPostMethod(
  //         '$baseUrl$loginUrl', json.encode(body));
  //     print("just print ${jsonDecode(response.body)}");

  //     var data = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       SharedPreferences share = await SharedPreferences.getInstance();
  //       SharedPreferencesHelper(share).putBool(Preferences.userLogin, true);
  //       SharedPreferencesHelper(share)
  //           .putInt(Preferences.userID, data['data']['user_id']);
  //       SharedPreferencesHelper(share)
  //           .putObjectList(Preferences.userFullDetails, data);
  //       Get.to(CongratulationScreen());
  //     } else {
  //       //set pop
  //       Get.snackbar("Error", "Please try again.",
  //           duration: Duration(seconds: 2),
  //           snackPosition: SnackPosition.BOTTOM);
  //     }
  //     // print("just print ${jsonDecode(response.body)['data']}");
  //   } catch (e) {}
  // }
}







// ---------------------------------------



// import 'package:get/get.dart';
// import '../Models/Question_model.dart';
// import '../Views/Congratulation_view.dart';

// class QuestionController extends GetxController {
//   RxInt currentQuestionIndex = 1.obs;
//   RxList<QuestionModel> questions = <QuestionModel>[
//     QuestionModel(
//       question:
//           'Lassi paratha and mixed vegetables are staple food of which states?',
//       options: ['A: Gujarat', 'B: Maharashtra', 'C: Rajasthan', 'D: Punjab'],
//       trueAnswer: 'D: Punjab',
//     ),
//     QuestionModel(
//       question: 'Second Question',
//       options: ['A: Option A', 'B: Option B', 'C: Option C', 'D: Option D'],
//       trueAnswer: 'A: Option A',
//     ),
//     QuestionModel(
//       question: 'Third Question',
//       options: ['A: abc', 'B: def', 'C: jkl', 'D: xyz'],
//       trueAnswer: 'C: jkl',
//     ),
//     QuestionModel(
//       question: 'Forth Question',
//       options: ['A: Apple', 'B: Banana', 'C: Mango', 'D: Orange'],
//       trueAnswer: 'D: Orange',
//     ),
//   ].obs;

//   RxInt selectedOptionIndex = (-1).obs;

//   bool isOptionCorrect(int index) {
//     return index == _getCorrectOptionIndex();
//   }

//   void checkAnswer(int selectedOptionIndex) {
//     this.selectedOptionIndex.value = selectedOptionIndex;

//     Future.delayed(Duration(seconds: 1), () {
//       moveToNextQuestion();
//     });
//   }

//   int _getCorrectOptionIndex() {
//     return questions[currentQuestionIndex.value - 1]
//         .options
//         .indexOf(questions[currentQuestionIndex.value - 1].trueAnswer);
//   }

//   void moveToNextQuestion() {
//     if (currentQuestionIndex < questions.length) {
//       currentQuestionIndex++;
//       selectedOptionIndex.value =
//           -1; // Reset selected option for the new question
//     } else {
//       Get.to(CongratulationScreen());
//     }
//   }
// }
