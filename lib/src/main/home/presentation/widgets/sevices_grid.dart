import 'package:flutter/material.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
import 'package:techara_merchant/src/main/home/domain/entity/mini_app_entity.dart';
import 'package:techara_merchant/src/main/mini_apps/events/presentation/pages/events_page.dart';
import 'package:techara_merchant/src/main/mini_apps/news/presentation/pages/news_page.dart';

class MiniAppsPage extends StatelessWidget {
  const MiniAppsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final miniApps = [
      MiniAppEntity(
        id: 'weather',
        name: 'Weather',
        page: const NewsPage(),
        icon: 'assets/icons/weather.png',
      ),
      MiniAppEntity(
        id: 'news',
        name: 'News',
        page: const NewsPage(),
        icon: 'assets/icons/news.png',
      ),
      MiniAppEntity(
        id: 'stores',
        name: 'Stores',
        page: const NewsPage(),
        icon: 'assets/icons/stores.png',
      ),
      MiniAppEntity(
        id: 'events',
        name: 'Events',
        page: const EventsPage(),
        icon: 'assets/icons/events.png',
      ),
      MiniAppEntity(
        id: 'surveys',
        name: 'Surveys',
        page: const NewsPage(),
        icon: 'assets/icons/surveys.png',
      ),
      MiniAppEntity(
        id: 'explore',
        name: 'Explore all',
        page: const NewsPage(),
        icon: 'assets/icons/explore.png',
      ),
    ];

    return Container(
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top section with blue number
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text('Services', style: textTheme.titleMedium),
          ),

          // Main content with pink border
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.6,
            padding: EdgeInsets.zero,

            physics: const NeverScrollableScrollPhysics(),
            children: miniApps
                .map(
                  (e) => _buildMiniAppItem(
                    label: e.name,

                    backgroundColor: colorScheme.surfaceContainerLow,
                    textStyle: textTheme.labelMedium!,
                    onTap: () {
                      navigatorKey.currentState!.push(
                        MaterialPageRoute(builder: (context) => e.page),
                      );
                    },
                  ),
                )
                .toList(),
          ),

          // Bottom blue numbers
        ],
      ),
    );
  }

  Widget _buildMiniAppItem({
    required String label,

    required Color backgroundColor,
    required TextStyle textStyle,
    required void Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      radius: 32,
      borderRadius: BorderRadius.circular(32),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/images/${label.replaceAll(" ", "_").toLowerCase()}.png",
              width: 48,
              height: 48,
            ),

            const SizedBox(width: 10),

            // Label
            Expanded(
              child: Text(
                label,
                style: textStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter for diagonal stripes background
