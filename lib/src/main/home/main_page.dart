import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techara_merchant/src/core/style/theme/theme_provider.dart';
import 'package:techara_merchant/src/main/home/presentation/widgets/banner_widget.dart';
import 'package:techara_merchant/src/main/home/presentation/widgets/bottom_search.dart';
import 'package:techara_merchant/src/main/home/presentation/widgets/sevices_grid.dart';
import 'package:techara_merchant/src/main/home/presentation/widgets/weather_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    // Start animations
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        // Material 3: Base surface color
        backgroundColor: colorScheme.surface,

        // Material 3: Surface tint color (usually primary color)
        surfaceTintColor: colorScheme.surfaceTint,

        // Smooth elevation animation
        scrolledUnderElevation: 4.0,

        flexibleSpace: Container(
          height: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const WeatherWidget(),
                const Spacer(),
                CircleAvatar(
                  radius: 24,
                  child: Text(
                    "Q",
                    style: textTheme.headlineLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.brightness_6),
        onPressed: () {
          context.read<AppThemeProvider>().toggleTheme();
        },
      ),
      bottomNavigationBar: BottomSearch(
        textTheme: textTheme,
        colorScheme: colorScheme,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: ListView(
            padding: const EdgeInsets.all(18),
            children: const [
              BannerWidget(),

              SizedBox(height: 18),
              MiniAppsPage(),
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
