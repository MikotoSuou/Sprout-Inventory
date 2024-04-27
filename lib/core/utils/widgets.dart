
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sprout_inventory/core/utils/extensions/string_ext.dart';

import '../../res/colors.dart';
import '../../res/values.dart' as values;

class SafeScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  const SafeScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation = FloatingActionButtonLocation.centerFloat,
    this.bottomNavigationBar,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: appBar,
    body: SafeArea(child: body),
    floatingActionButton: floatingActionButton,
    floatingActionButtonLocation: floatingActionButtonLocation,
    bottomNavigationBar: bottomNavigationBar,
    backgroundColor: backgroundColor,
  );
}


class Space extends StatelessWidget {
  const Space({
    super.key,
    this.width = values.Size.s0,
    this.height = values.Size.s0
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: width,
    height: height,
  );
}


class ImageNetwork extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;

  const ImageNetwork({
    super.key,
    required this.url,
    this.width = double.infinity,
    this.height,
  });

  @override
  Widget build(BuildContext context) => (url.isValidUrl)
      ? _buildNetworkImage
      : _buildDefaultImage;

  Widget get _buildDefaultImage => Container(
    width: width,
    height: height,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(values.Size.s8),
      color: ColorManager.primary,
    ),
    alignment: Alignment.center,
    child: const Icon(
      Icons.image_rounded,
      color: ColorManager.white,
      size: values.Size.s60,
    ),
  );

  Widget get _buildNetworkImage => Container(
    width: width,
    height: height,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(values.Size.s8),
      color: ColorManager.primary,
    ),
    child: Image.network(url, fit: BoxFit.cover),
  );
}

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;

  const ShimmerWidget({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.margin
  });

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: ColorManager.lightGrey,
    highlightColor: ColorManager.veryLightGrey,
    child: Container(
      width: width,
      height: height,
      margin: margin,
      decoration: ShapeDecoration(
        color: ColorManager.lightGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(values.Size.s8)),
      ),
    ),
  );
}