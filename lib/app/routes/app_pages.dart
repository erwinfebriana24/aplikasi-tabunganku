import 'package:get/get.dart';

import '../modules/add_data/bindings/add_data_binding.dart';
import '../modules/add_data/views/add_data_view.dart';
import '../modules/add_pengeluaran/bindings/add_pengeluaran_binding.dart';
import '../modules/add_pengeluaran/views/add_pengeluaran_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/edit_data/bindings/edit_data_binding.dart';
import '../modules/edit_data/views/edit_data_view.dart';
import '../modules/edit_pengeluaran/bindings/edit_pengeluaran_binding.dart';
import '../modules/edit_pengeluaran/views/edit_pengeluaran_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main_page/bindings/main_page_binding.dart';
import '../modules/main_page/views/main_page_view.dart';
import '../modules/pengeluaran/bindings/pengeluaran_binding.dart';
import '../modules/pengeluaran/views/pengeluaran_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DATA,
      page: () => const AddDataView(),
      binding: AddDataBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_DATA,
      page: () => const EditDataView(),
      binding: EditDataBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PENGELUARAN,
      page: () => const PengeluaranView(),
      binding: PengeluaranBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PENGELUARAN,
      page: () => const AddPengeluaranView(),
      binding: AddPengeluaranBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PENGELUARAN,
      page: () => const EditPengeluaranView(),
      binding: EditPengeluaranBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_PAGE,
      page: () => const MainPageView(),
      binding: MainPageBinding(),
    ),
  ];
}
