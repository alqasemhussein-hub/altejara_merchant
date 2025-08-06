import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/widgets/activity.dart';
import 'package:techara_merchant/src/core/widgets/category/category_bar.dart';
import 'package:techara_merchant/src/main/mini_apps/events/data/datasourse/event_remote.dart';
import 'package:techara_merchant/src/main/mini_apps/events/data/repositories/news_repository_impl.dart';
import 'package:techara_merchant/src/main/mini_apps/events/presentation/cubit/event_cubit.dart';
import 'package:techara_merchant/src/main/mini_apps/events/presentation/widgets/event_card.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          EventCubit(EventsRepositoryImpl(EventsRemoteDataSourceImpl()))
            ..getEvents(), // call data here
      child: const EventsView(),
    );
  }
}

class EventsView extends StatefulWidget {
  const EventsView({super.key});

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  String selectedCategory = 'All';
  final List<String> categories = ['All', 'Around Me', 'Music', 'Art'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Activity(
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
          'Events',
          style: theme.textTheme.titleMedium?.copyWith(
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
              // Handle filter action
            },
          ),
        ],
      ),
      child: BlocBuilder<EventCubit, EventState>(
        builder: (context, state) {
          if (state.remoteDataState == RemoteDataState.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: ListView(
                    shrinkWrap: true,

                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(width: 16),

                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainer,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Events',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Explore the latest events happening around you.',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainer,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Events',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Explore the latest events happening around you.',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
              (state.events?.length ?? 0) == 0
                  ? SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'No events found',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final event = state.events![index];
                        return EventCard(event: event);
                      }, childCount: state.events!.length),
                    ),
            ],
          );
        },
      ),
    );
  }
}
