import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class PhotoController extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null);

  Future<void> pickImage() async {
    //async :  jyare function ma  async lgavama aave tyare te "Future" return kre che .je function nu execution start krvani mnjuri ape che. ane tenu result future ma kyarek mlse.
    // async opration puru thvana wait krva mate await keyword no use async function ni andar thay che.
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource
            .gallery); // mobile ni gallry open krva and user ne image selcet krvani permission apva mate "image picker class " ni  "pickImage " method no use kre che.

    if (pickedFile != null) {
      //If pickedFile is not null (meaning image has been successfully picked), the code inside the curly braces { ... } will be executed.
      selectedImage.value = File(pickedFile.path);
    }
  }

  // Future<void> uploadImage() async {
  //   if (selectedImage.value == null) return;

  //   // Replace 'YOUR_UPLOAD_URL' with the actual URL where you want to upload the image
  //   final uploadUrl = Uri.parse('YOUR_UPLOAD_URL');

  //   List<int> imageBytes = selectedImage.value!.readAsBytesSync();
  //   String base64Image = base64Encode(imageBytes);

  //   final response = await http.post(
  //     uploadUrl,
  //     body: {
  //       'image': base64Image,
  //     },
  //   );

  //   // Handle the response as needed
  //   print(response.body);
  // }
}
