import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/certificate_list_page.dart';
import 'package:techara_merchant/src/main/home/presentation/home_page.dart';
import 'package:techara_merchant/src/main/profile/presentation/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      _animationController.forward().then((_) {
        _animationController.reverse();
      });

      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [HomePage(), CertificateListPage(), ProfilePage()],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          elevation: 0,
          backgroundColor: theme.colorScheme.surface,
          indicatorColor: theme.colorScheme.secondaryContainer,
          animationDuration: const Duration(milliseconds: 300),
          destinations: [
            NavigationDestination(
              icon: AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _selectedIndex == 0 ? _scaleAnimation.value : 1.0,
                    child: Icon(
                      _selectedIndex == 0
                          ? PhosphorIcons.house(PhosphorIconsStyle.fill)
                          : PhosphorIcons.house(),
                      color: _selectedIndex == 0
                          ? theme.colorScheme.onSecondaryContainer
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                  );
                },
              ),
              label: 'الرئيسية',
            ),
            NavigationDestination(
              icon: AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _selectedIndex == 1 ? _scaleAnimation.value : 1.0,
                    child: Icon(
                      _selectedIndex == 1
                          ? PhosphorIcons.certificate(PhosphorIconsStyle.fill)
                          : PhosphorIcons.certificate(),
                      color: _selectedIndex == 1
                          ? theme.colorScheme.onSecondaryContainer
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                  );
                },
              ),
              label: 'الشهادات',
            ),
            NavigationDestination(
              icon: AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _selectedIndex == 2 ? _scaleAnimation.value : 1.0,
                    child: Icon(
                      _selectedIndex == 2
                          ? PhosphorIcons.user(PhosphorIconsStyle.fill)
                          : PhosphorIcons.user(),
                      color: _selectedIndex == 2
                          ? theme.colorScheme.onSecondaryContainer
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                  );
                },
              ),
              label: 'الملف الشخصي',
            ),
          ],
        ),
      ),
    );
  }
}
