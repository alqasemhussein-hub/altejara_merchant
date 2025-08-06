class NewsTextStyle {
  final bool isBold;
  final double scale;
  final bool isDarkMode;

  NewsTextStyle({
    this.isBold = false,
    this.scale = 1.0,
    this.isDarkMode = false,
  });

  NewsTextStyle copyWith({bool? isBold, double? scale, bool? isDarkMode}) {
    return NewsTextStyle(
      isBold: isBold ?? this.isBold,
      scale: scale ?? this.scale,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  tojson() {
    return {'isBold': isBold, 'scale': scale, 'isDarkMode': isDarkMode};
  }

  factory NewsTextStyle.fromJson(dynamic json) {
    return NewsTextStyle(
      isBold: json['isBold'] ?? false,
      scale: (json['scale'] as num?)?.toDouble() ?? 1.0,
      isDarkMode: json['isDarkMode'] ?? false,
    );
  }
}
