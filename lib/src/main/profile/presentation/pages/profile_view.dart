import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/usecase/logout_usecase.dart';
import 'package:techara_merchant/src/main/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:techara_merchant/src/main/profile/presentation/pages/loading_profile.dart';
import 'package:techara_merchant/src/main/profile/presentation/pages/reset_password_page.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({super.key});

  @override
  State<ProfilePageView> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePageView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    if (context.read<ProfileCubit>().state.remoteState !=
        RemoteDataState.loaded) {
      context.read<ProfileCubit>().getHomeData();
    }
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'الملف الشخصي',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        actions: [
          IconButton(
            icon: Icon(PhosphorIcons.arrowClockwise(), color: Colors.white),
            onPressed: () {
              context.read<ProfileCubit>().getHomeData();
            },
          ),
          IconButton(
            onPressed: () {
              _showLogoutConfirmation(context);
            },
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                PhosphorIcons.signOut(),
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.remoteState == RemoteDataState.loading
              ? ProfileSkeletonLoading()
              : state.remoteState == RemoteDataState.error
              ? Center(
                  child: Text(
                    'حدث خطأ أثناء تحميل البيانات',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                )
              : CustomScrollView(
                  slivers: [
                    // App Bar with Profile Header
                    SliverAppBar(
                      expandedHeight: 250,
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
                            child: FadeTransition(
                              opacity: _fadeAnimation,
                              child: SlideTransition(
                                position: _slideAnimation,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Profile Avatar
                                    Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.white.withOpacity(0.3),
                                            Colors.white.withOpacity(0.1),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.3),
                                          width: 3,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.2,
                                            ),
                                            blurRadius: 20,
                                            offset: const Offset(0, 10),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        PhosphorIcons.user(
                                          PhosphorIconsStyle.fill,
                                        ),
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                    ),

                                    const SizedBox(height: 16),

                                    // Full Name
                                    Text(
                                      state.userData?.tajer.aName ?? '',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    // Company Name
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        state.userData?.tajer.arTitle ?? '',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // actions: [
                      //   // Edit Profile Button
                      //   IconButton(
                      //     onPressed: () {
                      //       _showEditDialog(context);
                      //     },
                      //     icon: Container(
                      //       padding: const EdgeInsets.all(8),
                      //       decoration: BoxDecoration(
                      //         color: Colors.white.withOpacity(0.2),
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //       child: Icon(
                      //         PhosphorIcons.pencil(),
                      //         color: Colors.white,
                      //         size: 20,
                      //       ),
                      //     ),
                      //   ),
                      //   // Logout Button
                      //   IconButton(
                      //     onPressed: () {
                      //       _showLogoutConfirmation(context);
                      //     },
                      //     icon: Container(
                      //       padding: const EdgeInsets.all(8),
                      //       decoration: BoxDecoration(
                      //         color: Colors.red.withOpacity(0.2),
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //       child: Icon(
                      //         PhosphorIcons.signOut(),
                      //         color: Colors.white,
                      //         size: 20,
                      //       ),
                      //     ),
                      //   ),
                      //   const SizedBox(width: 8),
                      // ],
                    ),

                    // Profile Information
                    SliverToBoxAdapter(
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Personal Information Section
                              _buildSectionHeader('المعلومات الشخصية'),
                              const SizedBox(height: 16),

                              _buildInfoCard([
                                _buildInfoItem(
                                  icon: PhosphorIcons.user(),
                                  label: 'الاسم الثلاثي',
                                  value: state.userData?.tajer.aName ?? '',
                                  color: Colors.blue,
                                ),
                                _buildInfoItem(
                                  icon: PhosphorIcons.buildings(),
                                  label: 'الاسم التجاري',
                                  value: state.userData?.tajer.arTitle ?? '',
                                  color: Colors.green,
                                ),
                              ]),

                              const SizedBox(height: 24),

                              // Contact Information Section
                              _buildSectionHeader('معلومات التواصل'),
                              const SizedBox(height: 16),

                              _buildInfoCard([
                                _buildInfoItem(
                                  icon: PhosphorIcons.envelope(),
                                  label: 'البريد الإلكتروني',
                                  value: state.userData?.tajer.email ?? '',
                                  color: Colors.orange,
                                  isEmail: true,
                                ),
                                _buildInfoItem(
                                  icon: PhosphorIcons.phone(),
                                  label: 'رقم الهاتف',
                                  value: state.userData?.tajer.email ?? '',
                                  color: Colors.purple,
                                  isPhone: true,
                                ),
                              ]),

                              const SizedBox(height: 24),

                              // Registration Information Section
                              _buildSectionHeader('معلومات التسجيل'),
                              const SizedBox(height: 16),

                              _buildInfoCard([
                                _buildInfoItem(
                                  icon: PhosphorIcons.cards(),
                                  label: 'رقم الاضبارة',
                                  value:
                                      state.userData?.tajer.azbaraNumber ?? '',
                                  color: Colors.red,
                                ),
                              ]),

                              const SizedBox(height: 32),

                              // Action Buttons
                              _buildActionButtons(context),

                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 24,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(List<Widget> items) {
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
        children: items.asMap().entries.map((entry) {
          int index = entry.key;
          Widget item = entry.value;

          return Column(
            children: [
              item,
              if (index < items.length - 1)
                Divider(height: 1, color: Colors.grey.shade200, indent: 60),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildInfoItem({
    required PhosphorIconData icon,
    required String label,
    required String value,
    required Color color,
    bool isEmail = false,
    bool isPhone = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: isEmail || isPhone
                      ? () {
                          _showActionSheet(
                            context,
                            value,
                            isEmail ? 'email' : 'phone',
                          );
                        }
                      : null,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isEmail || isPhone ? color : Colors.black87,
                      decoration: isEmail || isPhone
                          ? TextDecoration.underline
                          : null,
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (isEmail || isPhone)
            Icon(
              PhosphorIcons.caretLeft(),
              color: Colors.grey.shade400,
              size: 16,
            ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        // Edit Profile Button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              _showEditDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(PhosphorIcons.pencil(), size: 20),
                const SizedBox(width: 8),
                Text(
                  'تعديل كلمة المرور',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Logout Button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: OutlinedButton(
            onPressed: () {
              _showLogoutConfirmation(context);
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.red.shade400, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  PhosphorIcons.signOut(),
                  color: Colors.red.shade600,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'تسجيل الخروج',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.red.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showActionSheet(BuildContext context, String value, String type) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                type == 'email' ? 'البريد الإلكتروني' : 'رقم الهاتف',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              ListTile(
                leading: Icon(
                  type == 'email'
                      ? PhosphorIcons.copy()
                      : PhosphorIcons.phone(),
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  type == 'email' ? 'نسخ البريد الإلكتروني' : 'الاتصال',
                ),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        type == 'email'
                            ? 'تم نسخ البريد الإلكتروني'
                            : 'فتح تطبيق الهاتف...',
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),

              if (type == 'phone')
                ListTile(
                  leading: Icon(
                    PhosphorIcons.chatCircle(),
                    color: Colors.green,
                  ),
                  title: Text('إرسال رسالة'),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('فتح تطبيق الرسائل...'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _showEditDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (c) => ResetPasswordPage(),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  PhosphorIcons.signOut(),
                  color: Colors.red.shade600,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'تسجيل الخروج',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'هل أنت متأكد من أنك تريد تسجيل الخروج؟',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'ستحتاج إلى تسجيل الدخول مرة أخرى للوصول إلى حسابك',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  height: 1.3,
                ),
              ),
            ],
          ),
          actions: [
            // Cancel Button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'إلغاء',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Logout Confirmation Button
            ElevatedButton(
              onPressed: () {
                logoutUseCase();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(PhosphorIcons.signOut(), size: 18),
                  const SizedBox(width: 6),
                  Text(
                    'تسجيل الخروج',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
          actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        );
      },
    );
  }

  void _performLogout(BuildContext context) {
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'جاري تسجيل الخروج...',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        );
      },
    );

    // Simulate logout process
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop(); // Close loading dialog

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'تم تسجيل الخروج بنجاح',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          duration: const Duration(seconds: 2),
        ),
      );

      // Navigate to login page or handle logout logic
      // You can replace this with your actual logout logic
      // Navigator.of(context).pushReplacementNamed('/login');

      // For demo purposes, we'll just show the completion
      print('User logged out successfully');
    });
  }
}
