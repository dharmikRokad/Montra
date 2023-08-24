import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:montra/data/config/app_assets.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Account Balance',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.add),
          fabSize: ExpandableFabSize.regular,
          foregroundColor: AppColors.kFFFFFF,
          backgroundColor: AppColors.k7F3DFF,
          shape: const CircleBorder(),
        ),
        closeButtonBuilder: DefaultFloatingActionButtonBuilder(
          child: const Icon(Icons.close),
          fabSize: ExpandableFabSize.small,
          foregroundColor: AppColors.kFFFFFF,
          backgroundColor: AppColors.k7F3DFF,
          shape: const CircleBorder(),
        ),
        children: _buildFABs(),
      ),
    );
  }

  List<Widget> _buildFABs() => [
        IconButton.filledTonal(
            onPressed: controller.onExpenseClick,
            icon: Image.asset(
              AppAssets.expense,
              color: AppColors.kFD3C4A,
            )),
        IconButton.filledTonal(
            onPressed: controller.onTransferClick,
            icon: Image.asset(
              AppAssets.transfer,
              color: AppColors.k0077FF,
            )),
        IconButton.filledTonal(
            onPressed: controller.onIncomeClick,
            icon: Image.asset(
              AppAssets.income,
              color: AppColors.k00A86B,
            )),
      ];
}
