import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImageRepo {
  Future pickImage({bool isCam = true}) async {
    try {
      final imagePicker = ImagePicker();

      XFile? image;

      if (isCam) {
        image = await imagePicker.pickImage(source: ImageSource.camera);
      } else {
        image = await imagePicker.pickImage(source: ImageSource.gallery);
      }

      if (image == null) {
        return null;
      }
      // var newImage = File(image.path);

      return image.path;
    } on PlatformException catch (e) {
      log("$e");
    }
  }
}
