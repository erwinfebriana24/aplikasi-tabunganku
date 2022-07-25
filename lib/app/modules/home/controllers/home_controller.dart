// ignore_for_file: avoid_print, prefer_const_constructors, unused_local_variable, unnecessary_cast, non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:menabung/app/data/db/database.dart';

class HomeController extends GetxController {

  String keluar = tr('keluar');
  String pilih_tanggal = tr('pilih_tanggal');
  String batal = tr('batal');
  String pilih = tr('pilih');
  String masukan_tanggal = tr('masukan_tanggal');
  String berhasil = tr('berhasil');
  String berhasil_menghapus = tr('berhasil_menghapus');

  //////////////////////////////////////////////
  late BannerAd bannerAd;
  RxBool isAdLoad = false.obs;
  dynamic formatted;
  RxString date = "".obs;
  ////////////Pencarian Bedasarkan Tanggal////////////////////
  List<Database> listDatabase = <Database>[];
  var listData = DatabaseManager.getAllDatabase();
  String valuess = "";
  //////////////////////////////////////////
  void searchByDate() {
    var data = listData.values.toList();
    listDatabase = data
        .where((element) => element.date!.toLowerCase().contains(date))
        .toList();
    valuess = date.toString();
    update();
  }

  void initBannerAd() async {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-6607178927612423/4967748819",
        listener: BannerAdListener(onAdLoaded: (ad) {
          isAdLoad.value = true;
          print(isAdLoad);
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
        }),
        request: AdRequest());
    await bannerAd.load();
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    formatted = serverFormater.format(displayDate);
    return formatted;
  }

  kondisiAwal() {
    var data = listData.values.toList();
    listDatabase = data;
    valuess = "";
    date.value = "";
    update();
  }

  int totalAllPrice() {
    int total = 0;
    final box = DatabaseManager.getAllDatabase();
    for (int i = 0; i < box.length; i++) {
      final data = box.getAt(i) as Database;
      total += data.price!;
    }
    update();
    return total;
  }
  int totalByDate() {
    int total = 0;
    for (int i = 0; i < listDatabase.length; i++) {
      final data = listDatabase[i] as Database;
      total += data.price!;
    }
    update();
    return total;
  }

  @override
  void onInit() {
    initBannerAd();
    super.onInit();
  }
}
