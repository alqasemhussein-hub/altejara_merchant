import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/src/core/extenstion/date_time.dart';
import 'package:techara_merchant/src/core/widgets/custom_image_widget.dart';
import 'package:techara_merchant/src/main/mini_apps/news/domain/entities/news_entity.dart';
import 'package:techara_merchant/src/main/mini_apps/news/presentation/pages/news_details.dart';
import 'package:techara_merchant/src/main/mini_apps/news/presentation/widgets/category_vertical_list.dart';

class NewsCard extends StatelessWidget {
  final NewsEntity newsItem;

  const NewsCard({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: () {
        // Handle event tap
        // For example, navigate to event details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailsPage(newsItem: newsItem),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: newsItem.isBreaking == true
                ? colorScheme.error
                : colorScheme.surfaceContainerHighest,

            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Padding(
              padding: const EdgeInsets.all(18).copyWith(bottom: 0),
              child: Column(
                spacing: 8,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CustomImageWidget(
                            errorWidget: Image.asset(
                              "assets/images/source.png",
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                            imageUrl: newsItem.sourceImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(newsItem.source, style: textTheme.labelMedium),
                    ],
                  ),

                  Text(newsItem.title, style: textTheme.labelLarge),
                  if (newsItem.postImage != null)
                    SizedBox(
                      height: 190,
                      child: Stack(
                        children: [
                          if (newsItem.postImage != null)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: CustomImageWidget(
                                imageUrl: newsItem.postImage!,
                                fit: BoxFit.cover,
                              ),
                            ),

                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            top: 66,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    colorScheme.surfaceContainerLow,
                                    colorScheme.surfaceContainerLow.withAlpha(
                                      0,
                                    ),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: CategoryVerticalList(newsEntity: newsItem),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (newsItem.postImage == null)
                    CategoryVerticalList(newsEntity: newsItem),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    PhosphorIcons.clock(PhosphorIconsStyle.bold),
                    color: colorScheme.onSurfaceVariant,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    newsItem.publishedAt.toNewsFormat(),
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
