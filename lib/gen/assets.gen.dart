/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsAudiosGen {
  const $AssetsAudiosGen();

  /// File path: assets/audios/dong_kiem_em.mp3
  String get dongKiemEm => 'assets/audios/dong_kiem_em.mp3';
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  $AssetsIconsPngGen get png => const $AssetsIconsPngGen();
  $AssetsIconsSvgGen get svg => const $AssetsIconsSvgGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();
}

class $AssetsIconsPngGen {
  const $AssetsIconsPngGen();

  /// File path: assets/icons/png/launcher_icon.png
  AssetGenImage get launcherIcon =>
      const AssetGenImage('assets/icons/png/launcher_icon.png');

  /// File path: assets/icons/png/splash_icon.png
  AssetGenImage get splashIcon =>
      const AssetGenImage('assets/icons/png/splash_icon.png');
}

class $AssetsIconsSvgGen {
  const $AssetsIconsSvgGen();

  /// File path: assets/icons/svg/apple.svg
  SvgGenImage get apple => const SvgGenImage('assets/icons/svg/apple.svg');

  /// File path: assets/icons/svg/check.svg
  SvgGenImage get check => const SvgGenImage('assets/icons/svg/check.svg');

  /// File path: assets/icons/svg/chervon_down.svg
  SvgGenImage get chervonDown =>
      const SvgGenImage('assets/icons/svg/chervon_down.svg');

  /// File path: assets/icons/svg/chervon_left.svg
  SvgGenImage get chervonLeft =>
      const SvgGenImage('assets/icons/svg/chervon_left.svg');

  /// File path: assets/icons/svg/chervon_left_circle.svg
  SvgGenImage get chervonLeftCircle =>
      const SvgGenImage('assets/icons/svg/chervon_left_circle.svg');

  /// File path: assets/icons/svg/chervon_right.svg
  SvgGenImage get chervonRight =>
      const SvgGenImage('assets/icons/svg/chervon_right.svg');

  /// File path: assets/icons/svg/chervon_up.svg
  SvgGenImage get chervonUp =>
      const SvgGenImage('assets/icons/svg/chervon_up.svg');

  /// File path: assets/icons/svg/devices.svg
  SvgGenImage get devices => const SvgGenImage('assets/icons/svg/devices.svg');

  /// File path: assets/icons/svg/facebook.svg
  SvgGenImage get facebook =>
      const SvgGenImage('assets/icons/svg/facebook.svg');

  /// File path: assets/icons/svg/google.svg
  SvgGenImage get google => const SvgGenImage('assets/icons/svg/google.svg');

  /// File path: assets/icons/svg/heart.svg
  SvgGenImage get heart => const SvgGenImage('assets/icons/svg/heart.svg');

  /// File path: assets/icons/svg/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/svg/home.svg');

  /// File path: assets/icons/svg/library.svg
  SvgGenImage get library => const SvgGenImage('assets/icons/svg/library.svg');

  /// File path: assets/icons/svg/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/icons/svg/logo.svg');

  /// File path: assets/icons/svg/more.svg
  SvgGenImage get more => const SvgGenImage('assets/icons/svg/more.svg');

  /// File path: assets/icons/svg/pause.svg
  SvgGenImage get pause => const SvgGenImage('assets/icons/svg/pause.svg');

  /// File path: assets/icons/svg/play.svg
  SvgGenImage get play => const SvgGenImage('assets/icons/svg/play.svg');

  /// File path: assets/icons/svg/play_next.svg
  SvgGenImage get playNext =>
      const SvgGenImage('assets/icons/svg/play_next.svg');

  /// File path: assets/icons/svg/play_prev.svg
  SvgGenImage get playPrev =>
      const SvgGenImage('assets/icons/svg/play_prev.svg');

  /// File path: assets/icons/svg/playlist.svg
  SvgGenImage get playlist =>
      const SvgGenImage('assets/icons/svg/playlist.svg');

  /// File path: assets/icons/svg/replay.svg
  SvgGenImage get replay => const SvgGenImage('assets/icons/svg/replay.svg');

  /// File path: assets/icons/svg/replay_active.svg
  SvgGenImage get replayActive =>
      const SvgGenImage('assets/icons/svg/replay_active.svg');

  /// File path: assets/icons/svg/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/svg/search.svg');

  /// File path: assets/icons/svg/share.svg
  SvgGenImage get share => const SvgGenImage('assets/icons/svg/share.svg');

  /// File path: assets/icons/svg/suffle.svg
  SvgGenImage get suffle => const SvgGenImage('assets/icons/svg/suffle.svg');

  /// File path: assets/icons/svg/suffle_active.svg
  SvgGenImage get suffleActive =>
      const SvgGenImage('assets/icons/svg/suffle_active.svg');
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/start_background.png
  AssetGenImage get startBackground =>
      const AssetGenImage('assets/images/png/start_background.png');
}

class Assets {
  Assets._();

  static const $AssetsAudiosGen audios = $AssetsAudiosGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
