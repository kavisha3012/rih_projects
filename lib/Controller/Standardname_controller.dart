import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../Models/Standardname_model.dart';

class StandardController extends GetxController {
  // Replace this with your actual data source or API call
  final standards = <StandardModel>[
    StandardModel(
      std: 1,
      subject: [
        SubjectModel(subjectName: 'Math', img: 'assets/images/math.jpeg'),
        SubjectModel(subjectName: 'Science', img: 'assets/images/science.png'),
        SubjectModel(subjectName: 'Gujarati', img: 'assets/images/gujrati.png'),
        SubjectModel(subjectName: 'English', img: 'assets/images/english.jpeg'),
      ],
    ),
    StandardModel(
      std: 2,
      subject: [
        SubjectModel(subjectName: 'Math', img: 'assets/images/math.jpeg'),
        SubjectModel(subjectName: 'Science', img: 'assets/images/science.png'),
        SubjectModel(subjectName: 'Gujarati', img: 'assets/images/gujrati.png'),
        SubjectModel(subjectName: 'English', img: 'assets/images/english.jpeg'),
      ],
    ),
    StandardModel(
      std: 3,
      subject: [
        SubjectModel(subjectName: 'Math', img: 'assets/images/math.jpeg'),
        SubjectModel(subjectName: 'Science', img: 'assets/images/science.png'),
        SubjectModel(subjectName: 'Gujarati', img: 'assets/images/gujrati.png'),
        SubjectModel(subjectName: 'English', img: 'assets/images/english.jpeg'),
      ],
    ),

    StandardModel(
      std: 4,
      subject: [
        SubjectModel(subjectName: 'Math', img: 'assets/images/math.jpeg'),
        SubjectModel(subjectName: 'Science', img: 'assets/images/science.png'),
        SubjectModel(subjectName: 'Gujarati', img: 'assets/images/gujrati.png'),
        SubjectModel(subjectName: 'English', img: 'assets/images/english.jpeg'),
      ],
    ),
    // Add more data as needed
  ].obs;
}
