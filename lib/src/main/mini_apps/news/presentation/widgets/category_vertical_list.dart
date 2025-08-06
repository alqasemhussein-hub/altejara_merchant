import 'package:flutter/material.dart';
import 'package:techara_merchant/src/core/widgets/custom_action_button.dart';
import 'package:techara_merchant/src/main/mini_apps/news/domain/entities/news_entity.dart';

class CategoryVerticalList extends StatelessWidget {
  const CategoryVerticalList({
    super.key,
    required this.newsEntity,
    this.onReadMore,
  });

  final NewsEntity newsEntity;
  final Function()? onReadMore;

  @override
  Widget build(BuildContext context) {
    final colorSchema = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 40,
      child: Row(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (newsEntity.isBreaking)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: colorSchema.error,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                'Breaking',
                style: textTheme.labelSmall!.copyWith(
                  color: colorSchema.onError,
                ),
              ),
            ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = newsEntity.categories[index];
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: colorSchema.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    category.name,
                    style: textTheme.labelSmall!.copyWith(
                      color: colorSchema.onSurface,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 4),
              itemCount: newsEntity.categories.length,
            ),
          ),
          if (onReadMore != null)
            CustomActionButton(
              onPress: onReadMore,
              title: 'Read',
              colorSchema: colorSchema,
              textTheme: textTheme,
              iconData: Icons.arrow_outward,
            ),
        ],
      ),
    );
  }
}
