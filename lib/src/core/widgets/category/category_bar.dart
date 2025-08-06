import 'package:flutter/material.dart';
import 'package:techara_merchant/src/core/widgets/category/category_header.dart';

class SliverCategoryBar extends SliverPersistentHeaderDelegate {
  final List<String> categories;
  final String selectedCategory;
  final void Function(String) onSelected;

  SliverCategoryBar({
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  double get minExtent => 60;

  @override
  double get maxExtent => 60;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final isPinned = shrinkOffset > 0;
    final color = Theme.of(context).colorScheme;

    return CategoryHeader(
      backgroundColor: isPinned ? color.surfaceContainer : color.surface,
      categories: categories,
      selectedCategory: selectedCategory,
      onSelected: (category) {
        onSelected(category);
      },
    );
  }

  @override
  bool shouldRebuild(covariant SliverCategoryBar oldDelegate) {
    return true;
  }
}
