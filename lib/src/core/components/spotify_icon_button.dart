import 'package:flutter/material.dart';

class SpotifyIconButton extends StatelessWidget {
  const SpotifyIconButton({
    Key? key,
    required this.icon,
    this.splashColor,
    this.onTap,
  }) : super(key: key);

  final Color? splashColor;
  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashFactory: InkRipple.splashFactory,
        splashColor: splashColor,
        child: icon,
      ),
    );
  }
}
