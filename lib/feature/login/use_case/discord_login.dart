import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../library/use_case.dart';

class DiscordLoginUseCase extends UnitUseCase<void> {
  DiscordLoginUseCase();

  @override
  Future<void> call() async {
    final supabase = Supabase.instance.client;
    print("object");
    await supabase.auth.signInWithOAuth(Provider.discord);
  }
}
