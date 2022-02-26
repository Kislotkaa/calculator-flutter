import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/CalcBottomBar.dart';
import '../../widgets/CalcTopBar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final Color color = const Color.fromARGB(255, 233, 66, 16);

  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => CalcTopBar(
                  helper: controller.helper.value,
                  text: controller.text.value,
                )),
            const SizedBox(height: 16),
            CalcBottomBar(
              controller: controller,
              color: color,
            )
          ],
        ).paddingAll(12),
      ),
    );
  }
}
