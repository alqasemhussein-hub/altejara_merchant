import 'package:flutter/material.dart';

class ProfileSkeletonLoading extends StatefulWidget {
  const ProfileSkeletonLoading({super.key});

  @override
  State<ProfileSkeletonLoading> createState() => _ProfileSkeletonLoadingState();
}

class _ProfileSkeletonLoadingState extends State<ProfileSkeletonLoading>
    with TickerProviderStateMixin {
  late AnimationController _shimmerController;
  late AnimationController _pulseController;
  late AnimationController _waveController;

  late Animation<double> _shimmerAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();

    // Shimmer animation for moving gradient
    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Pulse animation for breathing effect
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Wave animation for staggered loading
    _waveController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _shimmerAnimation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOut),
    );

    _pulseAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _waveAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _waveController, curve: Curves.easeInOut),
    );

    // Start animations
    _shimmerController.repeat();
    _pulseController.repeat(reverse: true);
    _waveController.repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    _pulseController.dispose();
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          // Skeleton App Bar with Profile Header
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: theme.colorScheme.primary,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.primary.withOpacity(0.8),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Profile Avatar Skeleton
                      AnimatedBuilder(
                        animation: _pulseAnimation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _pulseAnimation.value,
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.3),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 3,
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 16),

                      // Name Skeleton
                      AnimatedBuilder(
                        animation: _shimmerAnimation,
                        builder: (context, child) {
                          return _buildShimmerContainer(
                            width: 180,
                            height: 24,
                            borderRadius: 6,
                            isLight: true,
                          );
                        },
                      ),

                      const SizedBox(height: 8),

                      // Company Name Skeleton
                      AnimatedBuilder(
                        animation: _shimmerAnimation,
                        builder: (context, child) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: _buildShimmerContainer(
                              width: 220,
                              height: 14,
                              borderRadius: 4,
                              isLight: true,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(8),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),

          // Profile Information Skeleton
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Personal Information Section Skeleton
                  _buildSkeletonSection(0),
                  const SizedBox(height: 16),
                  _buildSkeletonInfoCard(2),

                  const SizedBox(height: 24),

                  // Contact Information Section Skeleton
                  _buildSkeletonSection(1),
                  const SizedBox(height: 16),
                  _buildSkeletonInfoCard(2),

                  const SizedBox(height: 24),

                  // Registration Information Section Skeleton
                  _buildSkeletonSection(2),
                  const SizedBox(height: 16),
                  _buildSkeletonInfoCard(1),

                  const SizedBox(height: 32),

                  // Action Buttons Skeleton
                  _buildSkeletonActionButtons(),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonSection(int index) {
    return AnimatedBuilder(
      animation: _waveAnimation,
      builder: (context, child) {
        double delay = index * 0.2;
        double opacity = (_waveAnimation.value - delay).clamp(0.0, 1.0);

        return Opacity(
          opacity: opacity > 0 ? 1.0 : 0.3,
          child: Row(
            children: [
              Container(
                width: 4,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              AnimatedBuilder(
                animation: _shimmerAnimation,
                builder: (context, child) {
                  return _buildShimmerContainer(
                    width: 140 + (index * 20),
                    height: 20,
                    borderRadius: 4,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSkeletonInfoCard(int itemCount) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: List.generate(itemCount, (index) {
          return AnimatedBuilder(
            animation: _waveAnimation,
            builder: (context, child) {
              double delay = index * 0.3;
              double opacity = (_waveAnimation.value - delay).clamp(0.0, 1.0);

              return Opacity(
                opacity: opacity > 0 ? 1.0 : 0.5,
                child: Column(
                  children: [
                    _buildSkeletonInfoItem(index),
                    if (index < itemCount - 1)
                      Divider(
                        height: 1,
                        color: Colors.grey.shade200,
                        indent: 60,
                      ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }

  Widget _buildSkeletonInfoItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          // Icon Skeleton
          AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _pulseAnimation.value,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            },
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Label Skeleton
                AnimatedBuilder(
                  animation: _shimmerAnimation,
                  builder: (context, child) {
                    return _buildShimmerContainer(
                      width: 80 + (index * 20),
                      height: 14,
                      borderRadius: 3,
                    );
                  },
                ),
                const SizedBox(height: 6),
                // Value Skeleton
                AnimatedBuilder(
                  animation: _shimmerAnimation,
                  builder: (context, child) {
                    return _buildShimmerContainer(
                      width: 150 + (index * 30),
                      height: 16,
                      borderRadius: 4,
                    );
                  },
                ),
              ],
            ),
          ),

          // Arrow Skeleton
          AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _pulseAnimation.value * 0.5,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonActionButtons() {
    return Column(
      children: [
        // Primary Button Skeleton
        AnimatedBuilder(
          animation: _waveAnimation,
          builder: (context, child) {
            double opacity = (_waveAnimation.value - 0.6).clamp(0.0, 1.0);

            return Opacity(
              opacity: opacity > 0 ? 1.0 : 0.3,
              child: AnimatedBuilder(
                animation: _shimmerAnimation,
                builder: (context, child) {
                  return _buildShimmerButton(height: 56, borderRadius: 16);
                },
              ),
            );
          },
        ),

        const SizedBox(height: 12),

        // Secondary Button Skeleton
        AnimatedBuilder(
          animation: _waveAnimation,
          builder: (context, child) {
            double opacity = (_waveAnimation.value - 0.7).clamp(0.0, 1.0);

            return Opacity(
              opacity: opacity > 0 ? 1.0 : 0.3,
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: AnimatedBuilder(
                  animation: _shimmerAnimation,
                  builder: (context, child) {
                    return _buildShimmerContainer(
                      width: double.infinity,
                      height: 56,
                      borderRadius: 16,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildShimmerContainer({
    required double width,
    required double height,
    required double borderRadius,
    bool isLight = false,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: Alignment(-1.0 + _shimmerAnimation.value, 0.0),
          end: Alignment(1.0 + _shimmerAnimation.value, 0.0),
          colors: isLight
              ? [
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.6),
                  Colors.white.withOpacity(0.3),
                ]
              : [
                  Colors.grey.shade300,
                  Colors.grey.shade100,
                  Colors.grey.shade300,
                ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
    );
  }

  Widget _buildShimmerButton({
    required double height,
    required double borderRadius,
  }) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: Alignment(-1.0 + _shimmerAnimation.value, 0.0),
          end: Alignment(1.0 + _shimmerAnimation.value, 0.0),
          colors: [
            Colors.grey.shade300,
            Colors.grey.shade100,
            Colors.grey.shade300,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}
