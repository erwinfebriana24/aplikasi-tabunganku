// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:menabung/app/data/db/database.dart';

class PengeluaranController extends GetxController {
  late BannerAd bannerAd;
  RxBool isAdLoad = false.obs;

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

  int sumTotal() {
    int total = 0;
    final box = DatabaseManager.getAllDatabasePengeluaran();
    for (int i = 0; i < box.length; i++) {
      final data = box.getAt(i) as DatabasePengeluaran;
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
