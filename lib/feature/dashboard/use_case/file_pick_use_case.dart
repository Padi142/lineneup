import 'package:image_picker/image_picker.dart';

import '../../../library/use_case.dart';

class PickFileUseCase extends UnitUseCase<XFile?> {
  PickFileUseCase();

  @override
  Future<XFile?> call() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return image;
    }

    return null;
  }
}
