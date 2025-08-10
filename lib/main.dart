import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
import 'package:techara_merchant/src/core/service/local_storage.dart';
import 'package:techara_merchant/src/core/style/theme/app_theme.dart';
import 'package:techara_merchant/src/core/style/theme/theme_provider.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/auth_page.dart';
import 'package:techara_merchant/src/main/main_page.dart';
import 'package:techara_merchant/src/main/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:techara_merchant/utils/injector.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar', 'SA'),

      theme: AppTheme.getTheme(Brightness.light),
      home: LocalDatabase.getUserEntity() == null
          ? const AuthPage()
          : const MainPage(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'), // English
        Locale('en'), // Spanish
      ],
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerDependencies();
  await configureHive();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppThemeProvider()),
        BlocProvider(create: (context) => ProfileCubit()),
        // Add other providers here if needed
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> configureHive() async {
  await Hive.initFlutter();
  await LocalDatabase.iniLocalDataBase();
}
