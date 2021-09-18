import 'package:get/get.dart';

import 'package:jsbank_remittance/app/modules/authorization/bindings/authorization_binding.dart';
import 'package:jsbank_remittance/app/modules/authorization/views/authorization_view.dart';
import 'package:jsbank_remittance/app/modules/home/bindings/home_binding.dart';
import 'package:jsbank_remittance/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHORIZATION,
      page: () => AuthorizationView(),
      binding: AuthorizationBinding(),
    ),
  ];
}
