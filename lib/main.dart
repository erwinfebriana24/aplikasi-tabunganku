// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:menabung/app/data/db/database.dart';
import 'package:menabung/theme/color.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DatabaseAdapter());
  Hive.registerAdapter(DatabasePengeluaranAdapter());
  Hive.registerAdapter(DatabaseGlobalAdapter());
  await Hive.openBox<Database>('database');
  await Hive.openBox<DatabasePengeluaran>('database_pengeluaran');
  await Hive.openBox<DatabaseGlobal>('database_global');
  await MobileAds.instance.initialize();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('id')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        saveLocale: true,
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: appGrey),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: appBlue),
                  borderRadius: BorderRadius.all(Radius.circular(10))))),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
    );
  }
}
