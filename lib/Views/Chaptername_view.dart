import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_mvc_quizbook/Views/Question_view.dart';
import 'package:new_mvc_quizbook/Views/Signup_view.dart';
import 'package:new_mvc_quizbook/Widgets/common_appbar.dart';
import '../Controller/Chaptername_controller.dart';
import 'Standardname_view.dart';

class CheptarNameScreen extends StatelessWidget {
  final ChapterController chapterController = Get.put(ChapterController());

  CheptarNameScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test app bar ')),
      body: Obx(() {
        return chapterController.currentIndex.value == 0
            ? StandardNameScreen()
            : (chapterController.currentIndex.value == 1
                ? ItemList(
                    subName: 'Science Static',
                    showAppbar: false,
                    items: chapterController.items,
                  )
                : SignUpScreen(mobileNumber: ''));
      }),
    );
  }
}

class ItemList extends StatelessWidget {
  ItemList(
      {super.key,
      required this.subName,
      required this.showAppbar,
      required this.items});
  final String subName;
  final bool showAppbar;
  final List<Map<String, dynamic>> items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppbar
          ? PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: CommonAppBarScreen(
                  title: subName, backgroundColor: Colors.white))
          : null,
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return CustomItem(
            logoIndex: item['logo_index'],
            logoImage: item['logo_image'],
            chName: item['ch_name'],
            teacherLogo: item['teacher_logo'],
            teacherName: item['teacher_name'],
            questionNo: item['question_no'],
            min: item['min'],
          );
        },
      ),
    );
  }
}

class CustomItem extends StatelessWidget {
  final String logoIndex;
  final String logoImage;
  final String chName;
  final String teacherLogo;
  final String teacherName;
  final int questionNo;
  final int min;

  CustomItem({
    required this.logoIndex,
    required this.logoImage,
    required this.chName,
    required this.teacherLogo,
    required this.teacherName,
    required this.questionNo,
    required this.min,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Get.to(QuestionScreen()),
        child: Card(
          color: Color.fromARGB(255, 255, 255, 255),
          // color: Colors.white,
          elevation: 10,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(logoImage),
              child: Text(
                logoIndex,
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              chName,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage(
                        teacherLogo,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(teacherName),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                        height: 17,
                        width: 20,
                        child: Image.asset('assets/images/question_icon.png')),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Question No: $questionNo'),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/images/time_icon.png')),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Min: $min'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
