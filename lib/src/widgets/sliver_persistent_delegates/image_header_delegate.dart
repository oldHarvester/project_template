import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageHeaderDelegate extends SliverPersistentHeaderDelegate {
  ImageHeaderDelegate({
    this.onShrinkOffsetChange,
    this.onVisible,
    this.onNonVisible,
    required this.maxHeight,
    required this.minHeight,
    required this.imageUrl,
    this.padding,
  });

  final double maxHeight;
  final double minHeight;
  final EdgeInsetsGeometry? padding;
  final String imageUrl;

  final void Function(double shrinkOffset)? onShrinkOffsetChange;
  final VoidCallback? onVisible;
  final VoidCallback? onNonVisible;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (onShrinkOffsetChange != null) {
      onShrinkOffsetChange!(shrinkOffset);
    }
    if (shrinkOffset >= maxHeight) {
      if (onNonVisible != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onNonVisible!();
        });
      }
    } else {
      if (onVisible != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onVisible!();
        });
      }
    }
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
