import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/src/core/extenstion/date_time.dart';
import 'package:techara_merchant/src/core/widgets/activity.dart';
import 'package:techara_merchant/src/main/mini_apps/events/domain/entities/events_entity.dart';

class EventDetailsPage extends StatefulWidget {
  final EventEntity event;
  const EventDetailsPage({super.key, required this.event});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage>
    with TickerProviderStateMixin {
  late AnimationController _staggerController;
  late AnimationController _headerController;
  late AnimationController _fabController;

  late List<Animation<double>> _staggerAnimations;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    // Stagger animation for content sections
    _staggerController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Header animation
    _headerController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    // FAB animation
    _fabController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Create stagger animations for different sections
    _staggerAnimations = List.generate(8, (index) {
      final start = index * 0.1;
      final end = start + 0.6;
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _staggerController,
          curve: Interval(
            start,
            end.clamp(0.0, 1.0),
            curve: Curves.easeOutCubic,
          ),
        ),
      );
    });
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _headerController.forward();
      _staggerController.forward();
      Future.delayed(const Duration(milliseconds: 800), () {
        _fabController.forward();
      });
    });
  }

  @override
  void dispose() {
    _staggerController.dispose();
    _headerController.dispose();
    _fabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Activity(
      appBar: AppBar(
        backgroundColor: colorScheme.surfaceContainer,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
            color: colorScheme.onSurface,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Events details',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: SizedBox(
        height: 50,
        child: FloatingActionButton.extended(
          elevation: 1,
          icon: Icon(
            PhosphorIcons.phone(PhosphorIconsStyle.bold),
            color: colorScheme.onSurface,
          ),
          label: Text('Call Number', style: theme.textTheme.labelLarge),
          onPressed: () {
            // Handle call action
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: BorderSide(
              color: colorScheme.surfaceContainerHighest,
              width: 2,
            ),
          ),
          backgroundColor: colorScheme.surfaceContainerLowest,
        ),
      ),

      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyHeaderDelegate(
              title: widget.event.title,
              animation: _staggerAnimations[0],
              theme: theme,
              colorScheme: colorScheme,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16).copyWith(top: 0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Category Tags - Animation 1
                if (widget.event.categories.isNotEmpty)
                  _AnimatedSection(
                    animation: _staggerAnimations[1],
                    child: _AnimatedWrap(
                      children: widget.event.categories
                          .asMap()
                          .entries
                          .map(
                            (entry) => _AnimatedCategoryTag(
                              label: entry.value,
                              theme: theme,
                              delay: Duration(milliseconds: entry.key * 100),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                const SizedBox(height: 10),

                // Event Images - Animation 2
                if (widget.event.imageUrls.isNotEmpty)
                  _AnimatedSection(
                    animation: _staggerAnimations[2],
                    child: SizedBox(
                      height: 173,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.event.imageUrls.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              right: index == widget.event.imageUrls.length - 1
                                  ? 0
                                  : 16,
                            ),
                            child: _AnimatedEventImage(
                              imageUrl: widget.event.imageUrls[index],
                              colorScheme: colorScheme,
                              delay: Duration(milliseconds: index * 200),
                              heroTag:
                                  'event_image_${index}_${widget.event.title}',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                const SizedBox(height: 10),

                // Description Section - Animation 3
                _AnimatedSection(
                  animation: _staggerAnimations[3],
                  child: _SectionWithTitle(
                    title: 'Description',
                    content: widget.event.description,
                    theme: theme,
                    colorScheme: colorScheme,
                  ),
                ),
                const SizedBox(height: 10),

                // Tickets Points Section - Animation 4
                _AnimatedSection(
                  animation: _staggerAnimations[4],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tickets points',
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      ...widget.event.ticketsPoints.asMap().entries.map(
                        (entry) => _AnimatedListItem(
                          text: entry.value,
                          theme: theme,
                          colorScheme: colorScheme,
                          delay: Duration(milliseconds: entry.key * 100),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Date and Location - Animation 5
                _AnimatedSection(
                  animation: _staggerAnimations[5],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date and location',
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      _AnimatedContainer(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(
                              color: colorScheme.surfaceContainerHighest,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: [
                              _AnimatedInfoDateAndLocationRow(
                                icon: PhosphorIcons.clock(
                                  PhosphorIconsStyle.bold,
                                ),
                                text:
                                    "${widget.event.startDate.toTimeOnly()} - ${widget.event.endDate.toTimeOnly()}",
                                theme: theme,
                                colorScheme: colorScheme,
                                delay: const Duration(milliseconds: 200),
                              ),
                              const SizedBox(height: 4),
                              _AnimatedInfoDateAndLocationRow(
                                icon: PhosphorIcons.mapPin(
                                  PhosphorIconsStyle.bold,
                                ),

                                text: widget.event.location,
                                theme: theme,
                                colorScheme: colorScheme,
                                delay: const Duration(milliseconds: 400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Location Map - Animation 6
                _AnimatedSection(
                  animation: _staggerAnimations[6],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location',
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      _AnimatedMapContainer(
                        colorScheme: colorScheme,
                        theme: theme,
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

// Animated Widgets
class _AnimatedSection extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const _AnimatedSection({required this.animation, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - animation.value)),
          child: Opacity(opacity: animation.value, child: child),
        );
      },
      child: child,
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final Animation<double> animation;
  final ThemeData theme;
  final ColorScheme colorScheme;

  _StickyHeaderDelegate({
    required this.title,
    required this.animation,
    required this.theme,
    required this.colorScheme,
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

    return _AnimatedSection(
      animation: animation,
      child: Container(
        color: isPinned ? colorScheme.surfaceContainer : colorScheme.surface,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        alignment: Alignment.centerLeft,
        child: Hero(
          tag: 'event_title_$title',
          child: Material(
            color: Colors.transparent,
            child: Text(
              title,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) => true;
}

class _AnimatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const _AnimatedButton({required this.onPressed, required this.child});

  @override
  State<_AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<_AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(scale: _scaleAnimation.value, child: child);
        },
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _AnimatedCategoryTag extends StatefulWidget {
  final String label;
  final ThemeData theme;
  final Duration delay;

  const _AnimatedCategoryTag({
    required this.label,
    required this.theme,
    required this.delay,
  });

  @override
  State<_AnimatedCategoryTag> createState() => _AnimatedCategoryTagState();
}

class _AnimatedCategoryTagState extends State<_AnimatedCategoryTag>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: widget.theme.colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                widget.label,
                style: widget.theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _AnimatedWrap extends StatelessWidget {
  final List<Widget> children;

  const _AnimatedWrap({required this.children});

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 12, runSpacing: 8, children: children);
  }
}

class _AnimatedEventImage extends StatefulWidget {
  final String? imageUrl;
  final ColorScheme colorScheme;
  final Duration delay;
  final String heroTag;

  const _AnimatedEventImage({
    required this.imageUrl,
    required this.colorScheme,
    required this.delay,
    required this.heroTag,
  });

  @override
  State<_AnimatedEventImage> createState() => _AnimatedEventImageState();
}

class _AnimatedEventImageState extends State<_AnimatedEventImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrl == null || widget.imageUrl!.isEmpty) {
      return const SizedBox();
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_slideAnimation.value, 0),
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Hero(
              tag: widget.heroTag,
              child: Container(
                width: 300,
                height: 280,
                decoration: BoxDecoration(
                  color: widget.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    widget.imageUrl!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _SectionWithTitle extends StatelessWidget {
  final String title;
  final String content;
  final ThemeData theme;
  final ColorScheme colorScheme;

  const _SectionWithTitle({
    required this.title,
    required this.content,
    required this.theme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _AnimatedListItem extends StatefulWidget {
  final String text;
  final ThemeData theme;
  final ColorScheme colorScheme;
  final Duration delay;

  const _AnimatedListItem({
    required this.text,
    required this.theme,
    required this.colorScheme,
    required this.delay,
  });

  @override
  State<_AnimatedListItem> createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<_AnimatedListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-0.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Text(
          widget.text,
          style: widget.theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: widget.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _AnimatedContainer extends StatefulWidget {
  final Widget child;

  const _AnimatedContainer({required this.child});

  @override
  State<_AnimatedContainer> createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<_AnimatedContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _scaleAnimation, child: widget.child);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _AnimatedInfoDateAndLocationRow extends StatefulWidget {
  final IconData icon;
  final String text;
  final ThemeData theme;
  final ColorScheme colorScheme;
  final Duration delay;

  const _AnimatedInfoDateAndLocationRow({
    required this.icon,
    required this.text,
    required this.theme,
    required this.colorScheme,
    required this.delay,
  });

  @override
  State<_AnimatedInfoDateAndLocationRow> createState() =>
      _AnimatedInfoDateAndLocationRowState();
}

class _AnimatedInfoDateAndLocationRowState
    extends State<_AnimatedInfoDateAndLocationRow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Row(
        children: [
          Icon(
            widget.icon,
            color: widget.colorScheme.onSurfaceVariant,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            widget.text,
            style: widget.theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _AnimatedMapContainer extends StatefulWidget {
  final ColorScheme colorScheme;
  final ThemeData theme;

  const _AnimatedMapContainer({required this.colorScheme, required this.theme});

  @override
  State<_AnimatedMapContainer> createState() => _AnimatedMapContainerState();
}

class _AnimatedMapContainerState extends State<_AnimatedMapContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: widget.colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C2C),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: const Color(0xFF2C2C2C),
                            child: const Center(
                              child: Icon(
                                LucideIcons.map,
                                color: Colors.white,
                                size: 60,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.3),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      spacing: 12,
                      children: [
                        Expanded(
                          child: Text(
                            '8C3J+HVJ, Baghdad, Baghdad Governorate',
                            style: widget.theme.textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        _AnimatedButton(
                          onPressed: () {},
                          child: ElevatedButton.icon(
                            iconAlignment: IconAlignment.start,
                            onPressed: () {},
                            icon: Icon(
                              LucideIcons.navigation2,
                              size: 20,
                              color: widget.colorScheme.onSurfaceVariant,
                            ),
                            label: Text(
                              'Directions',
                              style: widget.theme.textTheme.labelSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: widget.colorScheme.onSurfaceVariant,
                                  ),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  widget.colorScheme.surfaceContainerLowest,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
