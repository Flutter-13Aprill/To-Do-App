import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConnect {
  static Supabase? supabase;
  static Future<void> init() async {
    try {
      log("+++ connect supabase start ***");
      await dotenv.load(fileName: ".env");
      log("//////////////");
      supabase = await Supabase.initialize(
        url: dotenv.env["baseUrl"].toString(),
        anonKey: dotenv.env["anonKey"].toString(),
      );
      log("+++ connect supabase done ***");
      // await registerNewUser(
      //   userName: 'test',
      //   password: '123',
      //   confirmPassword: '123',
      // );
      await getUserInfo();
    } catch (error) {
      throw FormatException("There is error with connect DB $error");
    }
  }

  static getUserInfo() async {
    final result = await supabase?.client.from("usertable").select();
    print(result);
  }

  static registerNewUser({
    required String userName,
    required String password,
    required String confirmPassword,
  }) async {
    if (confirmPassword == password) {
      try {
        final result = await supabase?.client.from("usertable").insert({
          'username': userName,
          'password': password,
        });
        print(result);
      } catch (error) {
        throw FormatException("There is error with connect DB $error");
      }
    }
  }

  //   static getBootcamps() async {
  //     final result = await supabase?.client
  //         .from("bootcamps")
  //         .select(); // get data from Supabase as List of Map<String, dynamic>
  //     List<BootcampsModel> bootcamps =
  //         []; // Empty list of  object <BootcampsModel>
  //     if (result != null || result!.isNotEmpty) {
  //       // check if data from supabase is empty or null
  //       bootcamps = result.map((bootCm) {
  //         // before convert to model : {id: 1, name: معسكر Flutter, created_at: 2025-05-27T07:28:29.868659+00:00}
  //         return BootcampsModelMapper.fromMap(
  //           bootCm,
  //         ); // after convert to BootcampsModel:  BootcampsModel(id: 1, name: معسكر Flutter, createdAt: 2025-05-27T07:28:29.868659+00:00)
  //       }).toList();
  //     }

  //     return bootcamps;
  //   }

  //   /// get bootcamps
  //   static addNewStudent({required UserMode dataUser}) async {
  //     await supabase?.client
  //         .from('students')
  //         .insert(dataUser.mapForAddSupabase());
  //   }
  // }

  // changeFormatToDB({required String date}) {
  //   DateFormat formatInput = DateFormat('dd/mm/yyyy');
  //   DateTime dateInput = formatInput.parse(date);
  //   DateFormat formatOutput = DateFormat('mm-dd-yyyy');
  //   String dateOutPut = formatOutput.format(dateInput);

  //   return dateOutPut;
}
