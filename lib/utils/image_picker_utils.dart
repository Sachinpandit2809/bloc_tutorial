import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final _picker = ImagePicker();

  Future<XFile?> camaraCapture() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> GalleryPicker() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
