import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:montra/modules/home/view/home_view.dart';
import 'package:montra/modules/profile/view/profile_view.dart';
import 'package:montra/modules/transaction/view/transaction_view.dart';

import '../../../data/config/app_assets.dart';
import '../controller/tab_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => [
          const HomeView(),
          const TransactionView(),
          const ProfileView(),
        ][controller.currentIndex()],
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.currentIndex(),
          onDestinationSelected: controller.onTabChange,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: _buildDestinations(),
        ),
      ),
    );
  }

  List<Widget> _buildDestinations() => [
        NavigationDestination(
            icon: Image.asset(
              AppAssets.home,
              height: 25.h,
              width: 25.w,
            ),
            label: 'Home'),
        NavigationDestination(
            icon: Image.asset(
              AppAssets.transaction,
              height: 25.h,
              width: 25.w,
            ),
            label: 'Transaction'),
        NavigationDestination(
            icon: Image.asset(
              AppAssets.profile,
              height: 25.h,
              width: 25.w,
            ),
            label: 'Profile'),
      ];
}
