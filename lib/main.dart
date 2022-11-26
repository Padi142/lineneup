import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  QR.setUrlStrategy();

  await Supabase.initialize(
      url: "https://ynodkuxldoumbyyocxqt.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlub2RrdXhsZG91bWJ5eW9jeHF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjkxNDQzOTUsImV4cCI6MTk4NDcyMDM5NX0.MchgOzSFq13v_CNkqzL2ohE8wr0ZfBeocOF-noTUoBA",
      authCallbackUrlHostname: 'login-callback', // optional
      debug: true // optional
      );
  runApp(const LineupApp());
}
