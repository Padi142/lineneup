import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../library/use_case.dart';

class GetCurrentSessionUseCase extends UnitUseCase<Session?> {
  GetCurrentSessionUseCase();

  @override
  Future<Session?> call() async {
    final session = Supabase.instance.client.auth.currentSession;
    return session;
  }
}
