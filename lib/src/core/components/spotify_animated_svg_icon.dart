import 'package:animated_svg/animated_svg.dart';
import 'package:animated_svg/animated_svg_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpotifyAnimatedSvgIcon extends StatefulWidget {
  const SpotifyAnimatedSvgIcon({
    Key? key,
    required this.children,
    required this.controller,
    this.size = 24,
    this.duration = const Duration(milliseconds: 600),
    this.clockwise = true,
    this.onTap,
  }) : super(key: key);

  final List<SvgPicture> children;
  final double size;
  final Duration duration;
  final bool clockwise;
  final VoidCallback? onTap;
  final AnimatedSvgController controller;

  @override
  State<SpotifyAnimatedSvgIcon> createState() => _SpotifyAnimatedSvgIconState();
}

class _SpotifyAnimatedSvgIconState extends State<SpotifyAnimatedSvgIcon> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSvg(
      controller: widget.controller,
      size: widget.size,
      duration: widget.duration,
      clockwise: widget.clockwise,
      onTap: widget.onTap,
      children: widget.children,
    );
  }
}
