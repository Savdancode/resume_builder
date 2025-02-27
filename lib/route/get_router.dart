import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:resume_maker/controller/home/binding/landing_binding.dart';
import 'package:resume_maker/module/home/view/home_view.dart';
import 'package:resume_maker/module/home/view/landing_view.dart';
import 'package:resume_maker/route/app_rout.dart';

import '../controller/home/binding/home_binding.dart';

var getRouter = [
  GetPage(
    name: AppRoute.landing,
    page: () => const LandingView(
      title: 'Explore Now',
    ),
    binding: LandingBinding(),
  ),
  GetPage(
    name: AppRoute.home,
    page: () => const HomeView(),
    binding: HomeBinding(),
  ),
];
