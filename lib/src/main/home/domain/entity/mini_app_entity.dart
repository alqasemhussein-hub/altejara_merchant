import 'package:flutter/widgets.dart';

class MiniAppEntity {
  final String? id;
  final String name;
  final Widget page;
  final String icon;
  MiniAppEntity({
    this.id,
    required this.name,
    required this.page,
    required this.icon,
  });
}
