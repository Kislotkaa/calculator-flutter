import 'package:calculator/app/model/calcs_operation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/BaseRow.dart';
import '../../widgets/CalcBottomBar.dart';
import '../../widgets/CalcTopBar.dart';
import '../../widgets/CalcButton.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final Color color = Color.fromARGB(255, 233, 66, 16);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CalcTopBar(
                helper: controller.helper.value,
                text: controller.text.value,
              ),
              const SizedBox(height: 16),
              CalcBottomBar(controller: controller, color: color)
            ],
          ).paddingAll(12),
        ),
      ),
    );
  }
}
