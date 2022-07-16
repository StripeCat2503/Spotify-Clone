import 'package:flutter/material.dart';

class ScrollViewContainer extends StatelessWidget {
  const ScrollViewContainer({
    Key? key,
    this.children = const [],
    this.padding,
  }) : super(key: key);

  final List<Widget> children;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding,
      child: Column(
        children: children,
      ),
    );
  }
}
