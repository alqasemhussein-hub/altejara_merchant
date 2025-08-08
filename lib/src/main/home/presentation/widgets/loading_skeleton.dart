import 'package:flutter/material.dart';

class HomeLoadingSkeleton extends StatefulWidget {
  const HomeLoadingSkeleton({Key? key}) : super(key: key);

  @override
  _HomeLoadingSkeletonState createState() => _HomeLoadingSkeletonState();
}

class _HomeLoadingSkeletonState extends State<HomeLoadingSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(24),
      children: [
        _buildLatestTransactionsSkeleton(),

        const SizedBox(height: 24),
        _buildCertificatesStatusSkeleton(),

        // _buildHeaderSkeleton(),
        // _buildQuickAccessSkeleton(),
      ],
    );
  }

  Widget _buildLatestTransactionsSkeleton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildShimmerContainer(width: 100, height: 24, borderRadius: 4),
        const SizedBox(height: 16),

        // Transaction cards skeleton
        ...List.generate(2, (index) => _buildTransactionCardSkeleton()),
      ],
    );
  }

  Widget _buildTransactionCardSkeleton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Status indicator skeleton
          _buildShimmerContainer(width: 60, height: 24, borderRadius: 20),

          const SizedBox(width: 16),

          // Transaction details skeleton
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _buildShimmerContainer(
                          width: 20,
                          height: 20,
                          borderRadius: 4,
                        ),
                        const SizedBox(width: 8),
                        _buildShimmerContainer(
                          width: 80,
                          height: 16,
                          borderRadius: 4,
                        ),
                      ],
                    ),
                    _buildShimmerContainer(
                      width: 70,
                      height: 14,
                      borderRadius: 4,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _buildShimmerContainer(
                          width: 16,
                          height: 16,
                          borderRadius: 4,
                        ),
                        const SizedBox(width: 8),
                        _buildShimmerContainer(
                          width: 90,
                          height: 16,
                          borderRadius: 4,
                        ),
                      ],
                    ),
                    _buildShimmerContainer(
                      width: 60,
                      height: 14,
                      borderRadius: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificatesStatusSkeleton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildShimmerContainer(width: 120, height: 24, borderRadius: 4),
        const SizedBox(height: 16),

        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.0,
          children: List.generate(4, (index) => _buildStatusCardSkeleton()),
        ),
      ],
    );
  }

  Widget _buildStatusCardSkeleton() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular progress skeleton
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: Stack(
              children: [
                // Outer circle shimmer
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _getShimmerColor(),
                  ),
                ),
                // Inner circle
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.all(12),
                  child: Center(
                    child: _buildShimmerContainer(
                      width: 20,
                      height: 18,
                      borderRadius: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          _buildShimmerContainer(width: 60, height: 16, borderRadius: 4),
        ],
      ),
    );
  }

  Widget _buildShimmerContainer({
    required double width,
    required double height,
    required double borderRadius,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: _getShimmerColor(),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }

  Color _getShimmerColor() {
    return Color.lerp(
      Colors.grey.shade300,
      Colors.grey.shade100,
      _animation.value,
    )!;
  }
}
