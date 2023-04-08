import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../library/use_case.dart';

class GoogleLoginUseCase extends UnitUseCase<void> {
  GoogleLoginUseCase();

  @override
  Future<void> call() async {
    final supabase = Supabase.instance.client;
    await supabase.auth.signInWithOAuth(
      Provider.google,
      redirectTo: "https://lineup-login.vercel.app/login-callback/",
    );
  }
}
