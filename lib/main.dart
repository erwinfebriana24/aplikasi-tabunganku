// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:menabung/app/data/db/database.dart';
import 'package:menabung/theme/color.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DatabaseAdapter());
  Hive.registerAdapter(DatabasePengeluaranAdapter());
  await Hive.openBox<Database>('database');
  await Hive.openBox<DatabasePengeluaran>('database_pengeluaran');
  await MobileAds.instance.initialize();
  runApp(
    GetMaterialApp(
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
    ),
  );
}
