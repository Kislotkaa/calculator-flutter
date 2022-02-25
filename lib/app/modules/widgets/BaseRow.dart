import 'package:flutter/material.dart';

class BaseRow extends StatelessWidget {
  final List<Widget> children;
  const BaseRow({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: children,
      ),
    );
  }
}
