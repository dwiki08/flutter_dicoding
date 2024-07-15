import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class FilePickerProvider extends ChangeNotifier {
  XFile? imageFile;
  String? imagePath;

  void setFile(XFile? value) {
    imageFile = value;
    notifyListeners();
  }

  void setFilePath(String? value) {
    imagePath = value;
    notifyListeners();
  }
}
