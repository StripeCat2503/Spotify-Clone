import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    Key? key,
    required this.child,
    this.allowNativePop = true,
    this.onBack,
  }) : super(key: key);

  final bool allowNativePop;
  final Widget child;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: child,
      onWillPop: () async {
        onBack?.call();

        return allowNativePop;
      },
    );
  }
}
