import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/widgets/activity.dart';
import 'package:techara_merchant/src/core/widgets/category/category_bar.dart';
import 'package:techara_merchant/src/main/mini_apps/news/data/datasourse/news_remote.dart';
import 'package:techara_merchant/src/main/mini_apps/news/data/repositories/news_repository_impl.dart';
import 'package:techara_merchant/src/main/mini_apps/news/domain/entities/news_entity.dart';
import 'package:techara_merchant/src/main/mini_apps/news/presentation/cubit/news_cubit.dart';
import 'package:techara_merchant/src/main/mini_apps/news/presentation/widgets/news_card.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          NewsCubit(NewsRepositoryImpl(NewsRemoteDataSourceImpl()))
            ..getNews(), // call data here
      child: const NewsView(),
    );
  }
}

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  String selectedCategory = 'All';
  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'All',
      'Politics',
      'Technology',
      'Business',
      'Business',
    ];
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return Skeletonizer(
          enableSwitchAnimation: true,
          effect: ShimmerEffect(
            baseColor: colorScheme.surfaceContainerHighest,
            highlightColor: Theme.of(
              context,
            ).colorScheme.onSurface.withOpacity(0.1),
          ),
          enabled: state.remoteDataState == RemoteDataState.loading,
          child: Activity(
            appBar: AppBar(
              backgroundColor: colorScheme.surfaceContainer,
              automaticallyImplyLeading: false,
              centerTitle: true,
              leading: IconButton(
                icon: Icon(
                  PhosphorIcons.x(PhosphorIconsStyle.bold),
                  color: colorScheme.onSurface,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                'News',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    PhosphorIcons.arrowsClockwise(PhosphorIconsStyle.bold),
                    color: colorScheme.onSurface,
                  ),
                  onPressed: () {
                    context.read<NewsCubit>().getNews();
                  },
                ),
              ],
            ),
            child: CustomScrollView(
              slivers: state.remoteDataState == RemoteDataState.loaded
                  ? [
                      if ((state.breakingNews?.length ?? 0) > 0)
                        SliverList(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            final breakItem = state.breakingNews![index];
                            if (index == 0) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ).copyWith(top: 16, bottom: 5),

                                child: Column(
                                  spacing: 10,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hot Topics",
                                      style: textTheme.titleLarge,
                                    ),

                                    NewsCard(newsItem: breakItem),
                                  ],
                                ),
                              );
                            }

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 16,
                              ),
                              child: NewsCard(newsItem: breakItem),
                            );
                          }, childCount: state.breakingNews!.length),
                        ),

                      SliverPersistentHeader(
                        pinned: true,
                        delegate: SliverCategoryBar(
                          categories: categories,
                          selectedCategory: selectedCategory,
                          onSelected: (category) {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                        ),
                      ),
                      (state.news?.length ?? 0) == 0
                          ? SliverToBoxAdapter(
                              child: Center(
                                child: Text(
                                  'No events found',
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            )
                          : SliverList(
                              delegate: SliverChildBuilderDelegate((
                                context,
                                index,
                              ) {
                                final newsItem = state.news![index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5.0,
                                    horizontal: 16,
                                  ),
                                  child: NewsCard(newsItem: newsItem),
                                );
                              }, childCount: state.news!.length),
                            ),
                      const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 24,
                        ), // Add some space at the end
                      ),
                    ]
                  : _buildLoadingSlivers(),
            ),

            // _buildBody(state),
          ),
        );
      },
    );
  }

  List<Widget> _buildLoadingSlivers() {
    return [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "Hot Topics",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),

      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
            child: NewsCard(
              newsItem: NewsEntity(
                description:
                    "Description Skeleton of the news item \n Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                title: "Title Skeleton of the news item",
                source: "Source Skeleton",
                categories: [
                  CategoryEntity(name: "Category 1", color: "blue"),
                  CategoryEntity(name: "Category 2", color: "red"),
                ],
                postImage: null,
                images: [],

                publishedAt: DateTime.now(),
                sourceImage:
                    "https://ina.iq/uploads/posts/2024-07/upload_1721722813_1682099244.jpg",
              ),
            ),
          ),
          childCount: 5,
        ),
      ),
    ];
  }
}
