import 'package:calculator/app/modules/widgets/BaseRow.dart';
import 'package:calculator/app/modules/widgets/CalcButton.dart';
import 'package:flutter/material.dart';

import '../../model/calcs_operation.dart';
import '../home/controllers/home_controller.dart';

class CalcBottomBar extends StatelessWidget {
  const CalcBottomBar({
    Key? key,
    required this.controller,
    required this.color,
  }) : super(key: key);

  final HomeController controller;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        BaseRow(
          children: [
            CalcButton(
              child: '=',
              onTap: () => controller.calc(),
              countExpend: 4,
            ),
          ],
        ),
      ],
    );
  }
}
