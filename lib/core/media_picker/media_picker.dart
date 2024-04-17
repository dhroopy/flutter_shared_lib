import 'dart:io';

abstract class MediaPicker<T> {
  Future<T?> pickMedia();

  String? getPath(T? media);
  
  File? convertMediaToFile(T? media);
}
