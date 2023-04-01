import 'package:lineneup/generic/event/domain/event_repository.dart';

import '../../../generic/artist/model/params/upload_event_cover_params.dart';
import '../../../generic/artist/model/results/upload_event_cover_result.dart';
import '../../../library/use_case.dart';

class UploadEventCoverUseCase
    extends UseCase<UploadEventCoverResult, UploadEventCoverParams> {
  EventRepository repository;

  UploadEventCoverUseCase({
    required this.repository,
  });

  @override
  Future<UploadEventCoverResult> call(params) async {
    // final UploadEventCoverResult result =
    //     await repository.eventCoverUpload(params);

    return const UploadEventCoverResult.success();
  }
}
