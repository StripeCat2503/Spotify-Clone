import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/gen/colors.gen.dart';
import 'package:spotify_clone/src/core/extensions/duration.dart';

class SpotifyMusicProgressBar extends StatelessWidget {
  final Color barColor;
  final Color thumbColor;
  final double thumbSize;
  final double height;
  final Duration duration;
  final Duration totalDuration;
  final TextStyle? textStyle;
  final ValueChanged<Duration>? onPositionChanged;
  final VoidCallback onDragStart;
  final VoidCallback onDragEnd;

  SpotifyMusicProgressBar({
    Key? key,
    required this.barColor,
    required this.thumbColor,
    required this.thumbSize,
    required this.height,
    required this.duration,
    required this.totalDuration,
    required this.onDragStart,
    required this.onDragEnd,
    this.textStyle,
    this.onPositionChanged,
  })  : assert(duration.inMilliseconds <= totalDuration.inMilliseconds),
        super(key: key);

  TextStyle get _textStyle => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        color: ColorName.white.withOpacity(0.84),
      );

  @override
  Widget build(BuildContext context) {
    double value = duration.inMilliseconds / totalDuration.inMilliseconds;
    if (duration.inMilliseconds == totalDuration.inMilliseconds) {
      value = 0.0;
    }

    return Column(
      children: [
        _SpotifyProgressBar(
          barColor: barColor,
          thumbColor: thumbColor,
          thumbSize: thumbSize,
          height: height,
          value: value,
          onChanged: _onChanged,
          onDragStart: onDragStart,
          onDragEnd: onDragEnd,
        ),
        SizedBox(
          height: 6.h,
        ),
        Row(
          children: [
            Text(
              duration.asMinutesSeconds,
              style: _textStyle.merge(textStyle),
            ),
            const Spacer(),
            Text(
              totalDuration.asMinutesSeconds,
              style: _textStyle.merge(textStyle),
            ),
          ],
        ),
      ],
    );
  }

  void _onChanged(double value) {
    final seconds = (value * totalDuration.inSeconds).floor();
    final changedDuration = Duration(seconds: seconds);

    onPositionChanged?.call(changedDuration);
  }
}

class _SpotifyProgressBar extends LeafRenderObjectWidget {
  final Color barColor;
  final Color thumbColor;
  final double thumbSize;
  final double height;
  final double value;
  final ValueChanged<double> onChanged;
  final VoidCallback onDragStart;
  final VoidCallback onDragEnd;

  const _SpotifyProgressBar({
    required this.barColor,
    required this.thumbColor,
    required this.thumbSize,
    required this.height,
    required this.value,
    required this.onChanged,
    required this.onDragStart,
    required this.onDragEnd,
  }) : assert(value >= 0.0 && value <= 1.0);

  @override
  _RenderSpotifyProgressBar createRenderObject(BuildContext context) {
    return _RenderSpotifyProgressBar(
      barColor: barColor,
      thumbColor: thumbColor,
      thumbSize: thumbSize,
      height: height,
      value: value,
      onChanged: onChanged,
      onDragStart: onDragStart,
      onDragEnd: onDragEnd,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant _RenderSpotifyProgressBar renderObject,
  ) {
    renderObject
      ..barColor = barColor
      ..thumbColor = thumbColor
      ..thumbSize = thumbSize
      ..height = height
      ..value = value
      ..onChanged = onChanged
      ..onDragStart = onDragStart
      ..onDragEnd = onDragEnd;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('barColor', barColor));
    properties.add(ColorProperty('thumbColor', thumbColor));
    properties.add(DoubleProperty('thumbSize', thumbSize));
  }
}

class _RenderSpotifyProgressBar extends RenderBox {
  Color _thumbColor;
  Color _barColor;
  double _thumbSize;
  double _height;
  double _value;
  ValueChanged<double> _onChanged;
  VoidCallback onDragStart;
  VoidCallback onDragEnd;

  late final HorizontalDragGestureRecognizer _dragGestureRecognizer;
  late final TapGestureRecognizer _tapGestureRecognizer;

  _RenderSpotifyProgressBar({
    required Color barColor,
    required Color thumbColor,
    required double thumbSize,
    required double height,
    required double value,
    required ValueChanged<double> onChanged,
    required this.onDragStart,
    required this.onDragEnd,
  })  : _barColor = barColor,
        _thumbColor = thumbColor,
        _thumbSize = thumbSize,
        _height = height,
        _value = value,
        _onChanged = onChanged {
    _dragGestureRecognizer = HorizontalDragGestureRecognizer()
      ..onStart = _onStartHorizontalDrag
      ..onUpdate = _onUpdateHorizontalDrag
      ..onEnd = _onEndHorizontalDrag;

    _tapGestureRecognizer = TapGestureRecognizer()..onTapDown = _onTapDown;
  }

  Color get barColor => _barColor;
  set barColor(Color value) {
    _barColor = value;
    markNeedsPaint();
  }

  Color get thumbColor => _thumbColor;
  set thumbColor(Color value) {
    _thumbColor = value;
    markNeedsPaint();
  }

  double get thumbSize => _thumbSize;
  set thumbSize(double value) {
    _thumbSize = value;
    markNeedsLayout();
  }

  double get height => _height;
  set height(double value) {
    _height = value;
    markNeedsLayout();
  }

  double get value => _value;
  set value(double value) {
    _value = value;
    markNeedsLayout();
  }

  ValueChanged<double> get onChanged => _onChanged;
  set onChanged(ValueChanged<double> value) {
    _onChanged = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final desiredWidth = constraints.maxWidth;
    final desiredHeight = thumbSize;

    final desiredSize = Size(desiredWidth, desiredHeight);

    return constraints.constrain(desiredSize);
  }

  @override
  // ignore: must_call_super
  double getMinIntrinsicWidth(double height) => 100.w;

  @override
  // ignore: must_call_super
  double getMaxIntrinsicWidth(double height) => double.infinity;

  @override
  // ignore: must_call_super
  double getMinIntrinsicHeight(double width) => thumbSize;

  @override
  // ignore: must_call_super
  double getMaxIntrinsicHeight(double width) => thumbSize;

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    canvas.save();
    canvas.translate(offset.dx, offset.dy);

    // paint bar
    final bgBarPaint = Paint()
      ..color = barColor.withOpacity(0.2)
      ..strokeWidth = height
      ..strokeCap = StrokeCap.round;

    final progressBarPaint = Paint()
      ..color = barColor
      ..strokeWidth = height
      ..strokeCap = StrokeCap.round;

    final point1 = Offset(0, size.height / 2);
    final point2 = Offset(size.width, size.height / 2);
    final valuePoint = Offset(value * size.width, size.height / 2);
    canvas.drawLine(point1, point2, bgBarPaint);
    canvas.drawLine(point1, valuePoint, progressBarPaint);

    // paint thumb
    final thumbPaint = Paint()..color = thumbColor;
    final thumbDx = value * size.width;
    final center = Offset(thumbDx, size.height / 2);
    canvas.drawCircle(center, thumbSize / 2, thumbPaint);
    canvas.restore();
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  bool get isRepaintBoundary => true;

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    assert(debugHandleEvent(event, entry));

    if (event is PointerDownEvent) {
      _dragGestureRecognizer.addPointer(event);
      _tapGestureRecognizer.addPointer(event);
    }
  }

  void _updateThumbPosition(Offset position) {
    final dx = position.dx.clamp(0, size.width);
    _value = dx / size.width;

    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  void _onStartHorizontalDrag(DragStartDetails details) {
    _updateThumbPosition(details.localPosition);
    onDragStart();
  }

  void _onUpdateHorizontalDrag(DragUpdateDetails details) {
    _updateThumbPosition(details.localPosition);
  }

  void _onTapDown(TapDownDetails details) {
    _updateThumbPosition(details.localPosition);
    onChanged(_value);
  }

  void _onEndHorizontalDrag(DragEndDetails details) {
    onChanged(_value);
    onDragEnd();
  }
}
