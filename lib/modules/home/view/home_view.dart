import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:montra/data/config/app_colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: AppColors.k7F3DFF,
      ),
      body: Container(),
    );
  }
}
