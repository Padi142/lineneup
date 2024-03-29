import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../library/use_case.dart';

class DiscordLoginUseCase extends UnitUseCase<void> {
  DiscordLoginUseCase();

  @override
  Future<void> call() async {
    final supabase = Supabase.instance.client;
    await supabase.auth.signInWithOAuth(
      Provider.discord,
      redirectTo: "https://lineup-login.vercel.app/login-callback/",
    );
  }
}
