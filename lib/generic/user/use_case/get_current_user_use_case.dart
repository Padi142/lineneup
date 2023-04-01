import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../library/use_case.dart';

class GetCurrentUserUseCase extends UnitUseCase<User?> {
  GetCurrentUserUseCase();

  @override
  Future<User?> call() async {
    final user = Supabase.instance.client.auth.currentUser;
    return user;
  }
}
