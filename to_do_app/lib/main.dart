import 'package:flutter/material.dart';
import 'package:to_do_app/mainApp.dart';
import 'package:to_do_app/repo/supabase.dart';
import 'package:to_do_app/utils/getit/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConnect.init();

  setupLocator();
  runApp(MainApp());
}
