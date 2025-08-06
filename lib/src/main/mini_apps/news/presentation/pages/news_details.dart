import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
import 'package:techara_merchant/src/core/extenstion/general.dart';
import 'package:techara_merchant/src/core/service/local_storage.dart';
import 'package:techara_merchant/src/core/style/theme/app_theme.dart';
import 'package:techara_merchant/src/core/style/theme/theme_provider.dart';
import 'package:techara_merchant/src/core/widgets/activity.dart';
import 'package:techara_merchant/src/core/widgets/carasol_widget.dart';
import 'package:techara_merchant/src/core/widgets/custom_image_widget.dart';
import 'package:techara_merchant/src/main/mini_apps/news/domain/entities/news_entity.dart';
import 'package:techara_merchant/src/main/mini_apps/news/domain/entities/news_text_style.dart';

class NewsDetailsPage extends StatefulWidget {
  const NewsDetailsPage({super.key, required this.newsItem});
  final NewsEntity newsItem;

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  ThemeData theme = AppTheme.getTheme(
    navigatorKey.currentContext!.watch<AppThemeProvider>().brightness,
  );
  TextTheme textTheme = AppTheme.getTheme(
    navigatorKey.currentContext!.watch<AppThemeProvider>().brightness,
  ).textTheme;

  String selectedCategory = 'All';
  TextScaler textScaler = const TextScaler.linear(1);
  NewsTextStyle newsTextStyle = LocalDatabase.getNewsTextStyle();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _changeTheme(newsTextStyle.isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    // final theme.colorScheme = theme.theme.colorScheme;
    final size = MediaQuery.of(context).size;

    return Theme(
      data: theme,

      child: Activity(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surfaceContainer,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              PhosphorIcons.x(PhosphorIconsStyle.bold),
              color: theme.colorScheme.onSurface,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Story', style: textTheme.titleMedium),
          actions: [
            IconButton(
              icon: Icon(
                PhosphorIcons.arrowsClockwise(PhosphorIconsStyle.bold),
                color: theme.colorScheme.onSurface,
              ),
              onPressed: () {
                // Handle filter action
              },
            ),
          ],
        ),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.newsItem.title,
                  style: textTheme.headlineSmall,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            if (widget.newsItem.images.isNotEmpty)
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 173,

                  child: SingleFocusCarousel(images: widget.newsItem.images),
                ),
              ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerLow,
                  border: Border.all(
                    color: theme.colorScheme.surfaceContainerHigh,
                  ),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 34,
                      width: 34,

                      child: CustomImageWidget(
                        borderRadius: 16,
                        imageUrl: widget.newsItem.sourceImage,
                      ),
                    ),

                    const SizedBox(width: 4),
                    Text(
                      widget.newsItem.source,
                      style: textTheme.labelLarge!.copyWith(),
                    ),
                    const Spacer(),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            theme.colorScheme.surfaceContainerHighest,
                        foregroundColor: theme.colorScheme.onSurface,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      iconAlignment: IconAlignment.end,
                      onPressed: () {},
                      icon: Icon(
                        PhosphorIcons.arrowUpRight(PhosphorIconsStyle.bold),
                      ),
                      label: const Text("Visit Link"),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            //ui for colored category
            _buildCategory(),

            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            // method to build control font panel
            _buildControll(size),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            // body of the news item
            SliverToBoxAdapter(
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: textScaler, // Prevent text scaling
                  boldText: newsTextStyle.isBold,
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  child: Text(
                    widget.newsItem.description,
                    style: textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          ],
        ),

        // _buildBody(state),
      ),
    );
  }

  SliverToBoxAdapter _buildCategory() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 40 + (newsTextStyle.scale * 10),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: widget.newsItem.categories[index].color.toColor(),
              borderRadius: BorderRadius.circular(24),
            ),

            child: Text(
              widget.newsItem.categories[index].name,
              style: textTheme.labelSmall!.copyWith(color: Colors.white),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          itemCount: widget.newsItem.categories.length,
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildControll(Size size) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLow,
          border: Border.all(color: theme.colorScheme.surfaceContainerHigh),
          borderRadius: BorderRadius.circular(26),
        ),
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text("Font settings", style: textTheme.labelLarge),

            Wrap(
              children: [
                IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    foregroundColor: theme.colorScheme.onSurface,
                  ),
                  onPressed: () {
                    _increaseFontSize();
                  },
                  icon: Icon(
                    PhosphorIcons.plus(PhosphorIconsStyle.bold),
                    size: 24,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    PhosphorIcons.textT(PhosphorIconsStyle.bold),
                    size: 24,
                  ),
                ),
                IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    foregroundColor: theme.colorScheme.onSurface,
                  ),
                  onPressed: () {
                    _decreaseFontSize();
                  },
                  icon: Icon(
                    PhosphorIcons.minus(PhosphorIconsStyle.bold),
                    size: 24,
                  ),
                ),
                IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    foregroundColor: theme.colorScheme.onSurface,
                  ),
                  onPressed: () => _changeTheme(),
                  icon: Icon(
                    PhosphorIcons.swatches(PhosphorIconsStyle.bold),
                    size: 24,
                  ),
                ),
                SizedBox(
                  child: IconButton.filled(
                    style: IconButton.styleFrom(
                      backgroundColor:
                          theme.colorScheme.surfaceContainerHighest,
                      foregroundColor: theme.colorScheme.onSurface,
                    ),
                    onPressed: () => _toggleTextBold(),
                    icon: Icon(
                      PhosphorIcons.textB(
                        newsTextStyle.isBold
                            ? PhosphorIconsStyle.bold
                            : PhosphorIconsStyle.regular,
                      ),
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _decreaseFontSize() {
    if (newsTextStyle.scale < 0.8) {
      return;
    }
    newsTextStyle = newsTextStyle.copyWith(scale: newsTextStyle.scale - 0.1);
    textScaler = TextScaler.linear(newsTextStyle.scale);
    LocalDatabase.saveNewsTextStyle(newsTextStyle);
    setState(() {});
  }

  void _increaseFontSize() {
    if (newsTextStyle.scale > 3) {
      return;
    }
    newsTextStyle = newsTextStyle.copyWith(scale: newsTextStyle.scale + 0.1);
    textScaler = TextScaler.linear(newsTextStyle.scale);

    LocalDatabase.saveNewsTextStyle(newsTextStyle);
    setState(() {});
  }

  void _toggleTextBold() {
    newsTextStyle = newsTextStyle.copyWith(isBold: !newsTextStyle.isBold);
    setState(() {});
    LocalDatabase.saveNewsTextStyle(newsTextStyle);
  }

  void _changeTheme([bool? isDarkMode]) {
    if (isDarkMode != null) {
      theme = AppTheme.getTheme(
        isDarkMode ? Brightness.dark : Brightness.light,
      );
      textTheme = theme.textTheme;
      return;
    }
    theme = AppTheme.getTheme(
      theme.brightness == Brightness.light ? Brightness.dark : Brightness.light,
    );
    textTheme = theme.textTheme;
    newsTextStyle = newsTextStyle.copyWith(
      isDarkMode: theme.brightness == Brightness.dark,
    );
    LocalDatabase.saveNewsTextStyle(newsTextStyle);
    setState(() {});
  }
}
