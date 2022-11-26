import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //final uri = Uri.base;
  //usePathUrlStrategy();

  await Supabase.initialize(
      url: "https://ynodkuxldoumbyyocxqt.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlub2RrdXhsZG91bWJ5eW9jeHF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjkxNDQzOTUsImV4cCI6MTk4NDcyMDM5NX0.MchgOzSFq13v_CNkqzL2ohE8wr0ZfBeocOF-noTUoBA",
      authCallbackUrlHostname: 'http://localhost:3000', // optional
      debug: true // optional
      );
  runApp(const LineupApp());
}
