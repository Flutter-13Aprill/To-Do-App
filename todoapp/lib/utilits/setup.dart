// import 'package:get_it/get_it.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:todoapp/repo/authrepo.dart';

// void setup() async {
//   // GetIt.I.registerSingletonAsync<AppDataLayer>(
//   //   () async => AppDataLayer()////هذاااا 
   
//   // );
// final getit=GetIt.instance;
//   GetIt.I.registerSingleton(()=>Supabase.instance.client);
//  GetIt.I.registerSingleton(()=>Authrepo(getit()));
// }



// final GetIt locetor=GetIt.instance;

// void initDi(){
//   // تسحيل بالسوبابيس كلاينت في اللوكيتر 
// // اللوكيتر هو القيت ات نفسه 
//  locetor.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
// //تسجيل الاوثوريبو السوبابيس من نفس اللوكيتر 
//  locetor.registerLazySingleton<Authrepo>(() => Authrepo(supabase: locetor<SupabaseClient>()));
// } 