import 'package:flutter/material.dart';
import 'package:resume_maker/module/home/compopent/treding.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    //final landingController = Get.find<HomeController>();
    return ListView(
      padding: const EdgeInsets.all(10),
      children: const <Widget>[
        Trending(),
      ],
    );
  }
}
