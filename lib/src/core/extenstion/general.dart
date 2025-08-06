import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/foundation.dart';

class L {
  static success({String? name, String? msg}) {
    kdp(name: name ?? "success", msg: msg, c: "gr");
  }

  static error({String? name, String? msg}) {
    kdp(name: name ?? "error", msg: msg, c: "r");
  }

  static warning({String? name, dynamic msg}) {
    kdp(name: name ?? "warning", msg: msg, c: "y");
  }

  static info({String? name, dynamic msg}) {
    kdp(name: name ?? "info", msg: msg, c: "cy");
  }
}

kdp({required name, required msg, required c}) {
  final col = {
    "r": "\x1B[31m",
    "gr": "\x1B[32m",
    "y": "\x1B[33m",
    "cy": "\x1B[36m",
    "b": "\x1B[34m",
    "m": "\x1B[35m",
  };

  if (Foundation.kDebugMode) {
    log("\x1B[37m  $name: ${col[c]}  $msg");
  }
}

extension SplitMatch<T> on List<T> {
  List<dynamic> splitMatch(bool Function(T element) matchFunction) {
    final listMatch = [];

    for (final element in this) {
      if (matchFunction(element)) {
        listMatch.add(element);
      }
    }

    return listMatch;
  }
}

extension ImageExtention on Uint8List {
  String? toBase64() {
    return base64Encode(this);
  }
}

extension ColorExtension on String {
  Color toColor() {
    if (startsWith('#')) {
      return hexToColor(this);
    } else {
      return hexToColor('#$this');
    }
  }
}

Color hexToColor(String hex) {
  hex = hex.replaceFirst('#', '');

  if (hex.length == 6) {
    hex = 'FF$hex'; // Add alpha if missing
  }

  return Color(int.parse(hex, radix: 16));
}
