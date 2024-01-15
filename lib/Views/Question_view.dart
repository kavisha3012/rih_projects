import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_mvc_quizbook/Controller/Question_controller.dart';
import 'package:new_mvc_quizbook/Utils/constants.dart';
import 'package:new_mvc_quizbook/Views/Congratulation_view.dart';
import 'package:new_mvc_quizbook/Widgets/common_answercard.dart';
import 'package:new_mvc_quizbook/Widgets/common_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  final QuestionController _questionController = QuestionController();

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = _questionController.questions[questionIndex];
    // if (selectedAnswerIndex == question.correctAnswerIndex) {
    //   score++;
    // }
    setState(() {});
  }

  void goToNextQuestion() {
    _questionController.moveToNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    // final question = _questionController.questions[questionIndex];
    bool isLastQuestion =
        questionIndex == _questionController.questions.length - 1;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: purpleColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: whiteColor,
          onPressed: () => Navigator.pop(context),
        ),
        title: Obx(
          () => Column(
            children: [
              Obx(
                () => Text(
                  '${_questionController.questions[questionIndex].question}',
                  style: TextStyle(color: whiteColor),
                ),
              ),
              Text(
                'Question ${_questionController.currentQuestionIndex.value}/15',
                style: const TextStyle(fontSize: 12, color: whiteColor),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Text(
            //   question.question,
            //   style: const TextStyle(
            //     fontSize: 21,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount:
                    _questionController.questions[questionIndex].options.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: InkWell(
                      onTap: selectedAnswerIndex == null
                          ? () => pickAnswer(index)
                          : null,
                      child: Obx(
                        () => AnswerCard(
                          currentIndex: index,
                          question: _questionController
                              .questions[questionIndex].options[index],
                          isSelected: selectedAnswerIndex == index,
                          selectedAnswerIndex: selectedAnswerIndex,
                          correctAnswerIndex: _questionController
                              .questions[questionIndex].trueAnswer,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Next Buttonconsconstt
            const Spacer(),

            isLastQuestion
                ? CommonButton(
                    onPress: () {
                      if (selectedAnswerIndex != null) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => CongratulationScreen(),
                          ),
                        );
                      } else {
                        null;
                      }
                    },
                    title: 'Finish',
                  )
                : CommonButton(
                    onPress: () {
                      if (selectedAnswerIndex != null) {
                        questionIndex = questionIndex + 1;
                        selectedAnswerIndex = null;
                        goToNextQuestion;
                      } else {}
                      //  selectedAnswerIndex != null ? goToNextQuestion  : null;
                      // void goToNextQuestion() {
                      //   print('call');

                      //   // setState(() {

                      //   // });
                      // }

                      setState(() {});
                    },
                    title: 'Next',
                  ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}




// ----------------------------------------------------------------


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../Controller/Question_controller.dart';
// import '../Utils/constants.dart';
// import '../Widgets/common_button.dart';

// class QuestionScreen extends StatelessWidget {
//   final QuestionController _questionController = Get.put(QuestionController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: purpleColor,
//         centerTitle: true,
//         elevation: 0,
//         title: Column(
//           children: [
//             const Text(
//               'Ch 1. Where does food come from?',
//               style: TextStyle(color: whiteColor),
//             ),
//             Text(
//               'Question ${_questionController.currentQuestionIndex.value}/15',
//               style: const TextStyle(fontSize: 12, color: whiteColor),
//             )
//           ],
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               color: purpleColor,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//               ),
//             ),
//             padding: EdgeInsets.all(20.0),
//             child: Obx(() => Text(
//                   _questionController
//                       .questions[
//                           _questionController.currentQuestionIndex.value - 1]
//                       .question,
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     color: Colors.white,
//                   ),
//                 )),
//           ),
//           Expanded(
//             child: Obx(() => ListView(
//                   children: List.generate(
//                     _questionController
//                         .questions[
//                             _questionController.currentQuestionIndex.value - 1]
//                         .options
//                         .length,
//                     (index) => OptionCard(
//                       optionText: _questionController
//                           .questions[
//                               _questionController.currentQuestionIndex.value -
//                                   1]
//                           .options[index],
//                       isCorrect: _questionController.isOptionCorrect(index),
//                       isSelected: index ==
//                           _questionController.selectedOptionIndex.value,
//                       onTap: () {
//                         _questionController.checkAnswer(index);
//                       },
//                     ),
//                   ),
//                 )),
//           ),
//         ],
//       ),
//       bottomNavigationBar: CommonButton(
//         onPress: () async {
//           _questionController.moveToNextQuestion();
//         },
//         title: 'Next',
//       ),
//     );
//   }
// }

// class OptionCard extends StatelessWidget {
//   final String optionText;
//   final bool isCorrect;
//   final bool isSelected;
//   final VoidCallback onTap;

//   OptionCard({
//     required this.optionText,
//     required this.isCorrect,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Color cardColor =
//         isSelected ? (isCorrect ? Colors.green : Colors.red) : Colors.white;
//     Color textColor = isSelected ? Colors.white : Colors.black;

//     return Card(
//       color: cardColor,
//       child: ListTile(
//         title: Text(
//           optionText,
//           style: TextStyle(
//             color: textColor,
//           ),
//         ),
//         onTap: onTap,
//       ),
//     );
//   }
// }
