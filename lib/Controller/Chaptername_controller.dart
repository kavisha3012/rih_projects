import 'package:get/get.dart';

class ChapterController extends GetxController {
  final currentIndex = 0.obs;
  final showAppbar = true.obs;
  final subName = 'Science Static'.obs;

  final items = [
    {
      'logo_index': '01',
      'logo_image': 'assets/images/normal_number_bg.png',
      'ch_name': 'Ch_1- Khorak kyathi mle che',
      'teacher_logo': 'assets/images/logo.png',
      'teacher_name': 'Abhishek Kumar',
      'question_no': 15,
      'min': 15,
    },
    {
      'logo_index': '02',
      'logo_image': 'assets/images/normal_number_bg.png',
      'ch_name': 'Ch_2- Aahar na ghatko',
      'teacher_logo': 'assets/images/logo.png',
      'teacher_name': 'Abhishek Kumar',
      'question_no': 15,
      'min': 20,
    },
    {
      'logo_index': '03',
      'logo_image': 'assets/images/normal_number_bg.png',
      'ch_name': 'Ch_3- Resa thi kapad Sudhi ',
      'teacher_logo': 'assets/images/logo.png',
      'teacher_name': 'Abhishek Kumar',
      'question_no': 15,
      'min': 20,
    },
    {
      'logo_index': '04',
      'logo_image': 'assets/images/normal_number_bg.png',
      'ch_name': 'Ch_4- Aahar na ghatko',
      'teacher_logo': 'assets/images/logo.png',
      'teacher_name': 'Abhishek Kumar',
      'question_no': 15,
      'min': 20,
    },
    {
      'logo_index': '05',
      'logo_image': 'assets/images/normal_number_bg.png',
      'ch_name': 'Ch_5- Aahar na ghatko',
      'teacher_logo': 'assets/images/logo.png',
      'teacher_name': 'Abhishek Kumar',
      'question_no': 15,
      'min': 20,
    },
    {
      'logo_index': '06',
      'logo_image': 'assets/images/normal_number_bg.png',
      'ch_name': 'Ch_3- Resa thi kapad Sudhi ',
      'teacher_logo': 'assets/images/logo.png',
      'teacher_name': 'Abhishek Kumar',
      'question_no': 15,
      'min': 20,
    },
    {
      'logo_index': '07',
      'logo_image': 'assets/images/normal_number_bg.png',
      'ch_name': 'Ch_3- Resa thi kapad Sudhi ',
      'teacher_logo': 'assets/images/logo.png',
      'teacher_name': 'Abhishek Kumar',
      'question_no': 15,
      'min': 20,
    },
    {
      'logo_index': '08',
      'logo_image': 'assets/images/normal_number_bg.png',
      'ch_name': 'Ch_3- Resa thi kapad Sudhi ',
      'teacher_logo': 'images/logo.png',
      'teacher_name': 'Abhishek Kumar',
      'question_no': 15,
      'min': 20,
    },
    // Add more items as needed
  ].obs;

  void onTabTapped(int index) {
    currentIndex.value = index;
  }
}
