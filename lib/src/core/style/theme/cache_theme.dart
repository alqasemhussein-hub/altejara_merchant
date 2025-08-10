// lib/services/theme_service.dart

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:techara_merchant/src/core/const/variable.dart';

@injectable
class ThemeService {
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  ThemeService()
    : colorScheme = Theme.of(navigatorKey.currentContext!).colorScheme,
      textTheme = Theme.of(navigatorKey.currentContext!).textTheme;
}
