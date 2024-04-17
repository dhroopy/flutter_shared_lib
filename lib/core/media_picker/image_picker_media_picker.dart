import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'media_picker.dart';

class ImagePickerMediaPicker extends MediaPicker<XFile> {
  ImagePicker picker;
  ImageSource source;
  ImagePickerMediaPicker({required this.source }) : picker = ImagePicker();

  @override
  File? convertMediaToFile(XFile? media) {
    if (media != null) {
      return File(media.path);
    }
    return null;
  }

  @override
  String? getPath(XFile? media) {
    String path = "";
    if (media != null) {
      path = media.path;
    }
    return path;
  }

  @override
  Future<XFile?> pickMedia() async {
    return await picker.pickImage(source: source);
  }
}
