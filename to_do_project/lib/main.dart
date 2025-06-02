import 'package:flutter/material.dart';
import 'package:to_do_project/screens/index/index_screen.dart';
// import 'package:to_do_project/screens/intro/onbaording/onbarding_screen.dart';
import 'package:to_do_project/screens/intro/onboarding.dart';
import 'package:to_do_project/screens/login_and_regiter/login_screen.dart';
import 'package:to_do_project/screens/nav/bottom_nav.dart';
import 'package:to_do_project/style/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_project/utils/supabase_connect.dart';
import 'package:to_do_project/utils/utils.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await SupabaseConnect.init();
  // setup();
  // await SupabaseConnect.getStudentsData();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: CustomTheme.darkTheme,
      home: BottomNav()
    );
  }
}
