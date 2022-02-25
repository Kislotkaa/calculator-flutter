import 'package:calculator/app/model/calcs_operation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/BaseRow.dart';
import '../../widgets/CalcBar.dart';
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
              CalcBar(
                helper: controller.helper.value,
                text: controller.text.value,
              ),
              const SizedBox(height: 16),
              BaseRow(
                children: [
                  CalcButton(
                    child: 'C',
                    countExpend: 3,
                    onTap: () => controller.clear(),
                  ),
                  CalcButton(
                    child: '/',
                    color: color,
                    onTap: () => controller.useOperation(Division()),
                  ),
                ],
              ),
              BaseRow(
                children: [
                  CalcButton(
                    child: '1',
                    onTap: () => controller.addSymbol('1'),
                  ),
                  CalcButton(
                    child: '2',
                    onTap: () => controller.addSymbol('2'),
                  ),
                  CalcButton(
                    child: '3',
                    onTap: () => controller.addSymbol('3'),
                  ),
                  CalcButton(
                    child: 'x',
                    color: color,
                    onTap: () => controller.useOperation(Multiplication()),
                  ),
                ],
              ),
              BaseRow(
                children: [
                  CalcButton(
                    child: '4',
                    onTap: () => controller.addSymbol('4'),
                  ),
                  CalcButton(
                    child: '5',
                    onTap: () => controller.addSymbol('5'),
                  ),
                  CalcButton(
                    child: '6',
                    onTap: () => controller.addSymbol('6'),
                  ),
                  CalcButton(
                    child: '-',
                    onTap: () => controller.useOperation(Minus()),
                    color: color,
                  ),
                ],
              ),
              BaseRow(
                children: [
                  CalcButton(
                    child: '7',
                    onTap: () => controller.addSymbol('7'),
                  ),
                  CalcButton(
                    child: '8',
                    onTap: () => controller.addSymbol('8'),
                  ),
                  CalcButton(
                    child: '9',
                    onTap: () => controller.addSymbol('9'),
                  ),
                  CalcButton(
                    child: '+',
                    onTap: () => controller.useOperation(Plus()),
                    color: color,
                  ),
                ],
              ),
              BaseRow(
                children: [
                  CalcButton(
                    child: '0',
                    onTap: () => controller.addSymbol('0'),
                    countExpend: 2,
                  ),
                  CalcButton(
                    child: '.',
                    onTap: () => controller.addSymbol('.'),
                  ),
                  CalcButton(
                    child: '^',
                    onTap: () => controller.useOperation(Pow()),
                    color: color,
                  ),
                ],
              ),
            ],
          ).paddingAll(12),
        ),
      ),
    );
  }
}
