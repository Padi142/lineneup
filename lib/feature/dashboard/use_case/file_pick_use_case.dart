import 'package:file_picker/file_picker.dart';

import '../../../library/use_case.dart';

class PickFileUseCase extends UnitUseCase<PlatformFile?> {
  PickFileUseCase();

  @override
  Future<PlatformFile?> call() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'gif'],
    );
    if (result != null) {
      return result!.files.first;
    }

    return null;
  }
}
