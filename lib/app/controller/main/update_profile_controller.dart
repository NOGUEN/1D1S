import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/core/base/base_controller.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileController extends BaseController
    with GetTickerProviderStateMixin {
  XFile? image;
  final picker = ImagePicker();
  final nickNameEditingController = TextEditingController();
  final aboutMeController = TextEditingController();
  var validNickNameValue = ''.obs;
  var validAboutMeValue = ''.obs;
  var currentTabIndex = 0.obs;
  var profileImageNumber = 0.obs;
  var imagePickerUsed = false.obs;
  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = XFile(pickedFile.path);
      imagePickerUsed.value = true;
      update();
    } else {}
  }

  @override
  void dispose() {
    nickNameEditingController.dispose();
    aboutMeController.dispose();
    super.dispose();
  }
}
