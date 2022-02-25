import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalcButton extends StatefulWidget {
  final String child;
  final int countExpend;
  final Color color;
  final Function() onTap;

  const CalcButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.countExpend = 1,
    this.color = const Color.fromARGB(255, 36, 36, 36),
  }) : super(key: key);

  @override
  State<CalcButton> createState() => _CalcButtonState();
}

class _CalcButtonState extends State<CalcButton> {
  late bool isActive = false;
  @override
  Widget build(BuildContext context) {
    double height = Get.width * 0.30;
    double margin = 4;
    double width = Get.width * 0.30 * widget.countExpend.toDouble();
    width = width + (margin * (widget.countExpend - 1)) * 2;
    BoxDecoration _decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: isActive
          ? widget.color.withOpacity(0.35)
          : widget.color.withOpacity(0.65),
    );
    return GestureDetector(
      onTapCancel: () => tapAction(false),
      onTapDown: (tap) {
        widget.onTap();
        tapAction(true);
      },
      onTapUp: (tap) => tapAction(false),
      child: AnimatedContainer(
        height: height,
        width: width,
        margin: EdgeInsets.all(margin),
        decoration: _decoration,
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 150),
        child: Text(
          widget.child,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 48,
          ),
        ),
      ),
    );

    return const SizedBox();
  }

  void tapAction(bool active) {
    setState(() {
      isActive = active;
    });
  }
}
