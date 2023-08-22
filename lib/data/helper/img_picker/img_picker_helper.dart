import 'package:image_picker/image_picker.dart';
import 'package:montra/data/config/logger.dart';

class ImgPickerHelper {
  static ImagePicker picker = ImagePicker();

  static Future<String> fromGallery() async {
    final XFile? img = await picker.pickImage(source: ImageSource.gallery);
    logI('img path: ${img?.path}');
    return img?.path ?? '';
  }

  static Future<String> fromCamera() async {
    final XFile? img = await picker.pickImage(source: ImageSource.camera);
    logI('img path: ${img?.path}');
    return img?.path ?? '';
  }
}
