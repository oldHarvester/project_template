import 'package:flutter/material.dart';

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  HeaderDelegate({
    required this.child,
    required this.minHeight,
    required this.maxHeight,
    this.allowRebuild = true,
  });
  final Widget child;
  final double minHeight;
  final double maxHeight;
  final bool allowRebuild;
  void Function(double shrinkOffset)? shrinkOffset;
  void Function(bool overlapsContent)? overlapsContent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (this.shrinkOffset != null) this.shrinkOffset!(shrinkOffset);
      if (this.overlapsContent != null) this.overlapsContent!(overlapsContent);
    });
    
    return child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      allowRebuild;
}
