import 'package:flutter/material.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
import 'package:techara_merchant/src/core/service/local_storage.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/auth_page.dart';

logoutUseCase() {
  LocalDatabase.clearAll();
  navigatorKey.currentState?.pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => AuthPage()),
    (route) => false,
  );
}
