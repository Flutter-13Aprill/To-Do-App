import 'package:flutter/material.dart';
import 'package:to_do_app/main_app.dart';
import 'package:to_do_app/repo/supabase.dart';
import 'package:to_do_app/utils/getit/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  await SupabaseConnect.init();

  runApp(MainApp());
}
