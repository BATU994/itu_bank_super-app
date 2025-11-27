// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsDataGen {
  const $AssetsDataGen();

  /// File path: assets/data/investment_companies_list.json
  String get investmentCompaniesList =>
      'assets/data/investment_companies_list.json';

  /// List of all assets
  List<String> get values => [investmentCompaniesList];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/airastana.png
  AssetGenImage get airastana =>
      const AssetGenImage('assets/images/airastana.png');

  /// File path: assets/images/bcc.png
  AssetGenImage get bcc => const AssetGenImage('assets/images/bcc.png');

  /// File path: assets/images/halykbank.png
  AssetGenImage get halykbank =>
      const AssetGenImage('assets/images/halykbank.png');

  /// File path: assets/images/kase.png
  AssetGenImage get kase => const AssetGenImage('assets/images/kase.png');

  /// File path: assets/images/kaspibank.png
  AssetGenImage get kaspibank =>
      const AssetGenImage('assets/images/kaspibank.png');

  /// File path: assets/images/kazaktelecom.png
  AssetGenImage get kazaktelecom =>
      const AssetGenImage('assets/images/kazaktelecom.png');

  /// File path: assets/images/kazatom.png
  AssetGenImage get kazatom => const AssetGenImage('assets/images/kazatom.png');

  /// File path: assets/images/kazmunaigaz.png
  AssetGenImage get kazmunaigaz =>
      const AssetGenImage('assets/images/kazmunaigaz.png');

  /// File path: assets/images/kaztransoil.png
  AssetGenImage get kaztransoil =>
      const AssetGenImage('assets/images/kaztransoil.png');

  /// File path: assets/images/kceel.png
  AssetGenImage get kceel => const AssetGenImage('assets/images/kceel.png');

  /// File path: assets/images/kegoc.png
  AssetGenImage get kegoc => const AssetGenImage('assets/images/kegoc.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    airastana,
    bcc,
    halykbank,
    kase,
    kaspibank,
    kazaktelecom,
    kazatom,
    kazmunaigaz,
    kaztransoil,
    kceel,
    kegoc,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsDataGen data = $AssetsDataGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
