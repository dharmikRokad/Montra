import 'package:image_picker/image_picker.dart';

class ImgPickerHelper {
  static ImagePicker picker = ImagePicker();

  static Future<String> fromGallery() async {
    final XFile? img = await picker.pickImage(source: ImageSource.gallery);
    return img?.path ?? '';
  }

  static Future<String> fromCamera() async {
    final XFile? img = await picker.pickImage(source: ImageSource.camera);
    return img?.path ?? '';
  }
}
