import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/api/models/home/certificate_data.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/form/create_certificate_page.dart';
import 'package:techara_merchant/src/main/core/widget/certificate_card.dart';
import 'package:techara_merchant/src/main/home/presentation/cubit/home_cubit.dart';
import 'package:techara_merchant/src/main/home/presentation/widgets/loading_skeleton.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(' الرئيسية'),
            centerTitle: false,

            actions: [
              IconButton(
                icon: Icon(
                  PhosphorIcons.clockClockwise(PhosphorIconsStyle.duotone),
                  color: theme.primaryColor,
                  size: 30,
                ),
                onPressed: () {
                  context.read<HomeCubit>().getHomeData();
                },
              ),
            ],
          ),
          body: SafeArea(
            child: state.state == RemoteDataState.loading
                ? HomeLoadingSkeleton()
                : state.state == RemoteDataState.error
                ? Center(child: Text('خطأ في تحميل البيانات'))
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Quick Access Card
                        _buildQuickAccessCard(),

                        const SizedBox(height: 32),

                        // Latest Transactions Section
                        _buildLatestTransactions(
                          state.homeData?.certificateData?.certificates ?? [],
                        ),

                        const SizedBox(height: 32),

                        // Certificates Status Section
                        _buildCertificatesStatus(
                          state.homeData?.certificateData?.acceptedCount ?? 0,
                          state.homeData?.certificateData?.pendingCount ?? 0,
                          state.homeData?.certificateData?.rejectedCount ?? 0,
                          state.homeData?.certificateData?.suspendedCount ?? 0,
                          state.homeData?.certificateData?.certificatesCount ??
                              0,
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildQuickAccessCard() {
    return InkWell(
      onTap: () {
        // Navigate to create certificate page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateCertificateForm()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.blue.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'طلب شهادة منشأ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'قم بطلب شهادة منشأ',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                PhosphorIcons.certificate(),
                color: Colors.white,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLatestTransactions(List<Certificate> recentTransactions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'اخر المعاملات',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),

        ...recentTransactions
            .map((transaction) => CertificateCard(transaction: transaction))
            .toList(),
      ],
    );
  }

  Widget _buildCertificatesStatus(
    int acceptedCount,
    int pendingCount,
    int rejectedCount,
    int suspendedCount,
    int total,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'حالات الشهادات',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),

        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.0,
          children: [
            _buildStatusCard(
              'مقبولة',
              acceptedCount,
              Colors.green,
              PhosphorIcons.checkCircle(),
              total,
            ),
            _buildStatusCard(
              'قيد الانتظار',
              pendingCount,
              Colors.orange,
              PhosphorIcons.clock(),
              total,
            ),
            _buildStatusCard(
              'مرفوضة',
              rejectedCount,
              Colors.red,
              PhosphorIcons.xCircle(),
              total,
            ),
            _buildStatusCard(
              'معلقة',
              suspendedCount,
              Colors.grey,
              PhosphorIcons.pause(),
              total,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusCard(
    String title,
    int count,
    Color color,
    PhosphorIconData icon,
    int total,
  ) {
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
          // Circular progress indicator
          SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              children: [
                // Background circle
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                  ),
                ),
                // Progress circle
                Container(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    value: _getProgressValue(count, total),
                    strokeWidth: 8,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                ),
                // Center content
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        count.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  double _getProgressValue(int count, int total) {
    // Calculate progress based on total certificates

    return total > 0 ? count / total : 0.0;
  }
}
