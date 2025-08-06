import 'package:intl/intl.dart';

// Complete DateTime Extension
extension DateTimeFormatting on DateTime {
  /// Formats DateTime to news-style format: "Today, 4:00 PM" or "Jan 15, 4:00 PM"
  String toNewsFormat() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final tomorrow = today.add(const Duration(days: 1));
    final dateToCheck = DateTime(year, month, day);

    // Format time part (e.g., "4:00 PM")
    final timeFormat = DateFormat('h:mm a');
    final timeString = timeFormat.format(this);

    if (dateToCheck == today) {
      return 'Today, $timeString';
    } else if (dateToCheck == yesterday) {
      return 'Yesterday, $timeString';
    } else if (dateToCheck == tomorrow) {
      return 'Tomorrow, $timeString';
    } else {
      // For other dates, check if it's within this week
      final daysDifference = dateToCheck.difference(today).inDays;

      if (daysDifference > 0 && daysDifference <= 6) {
        // Next few days this week
        final dayFormat = DateFormat('EEEE'); // Day name (e.g., "Monday")
        return '${dayFormat.format(this)}, $timeString';
      } else if (daysDifference < 0 && daysDifference >= -6) {
        // Last few days this week
        final dayFormat = DateFormat('EEEE');
        return '${dayFormat.format(this)}, $timeString';
      } else {
        // Show date for dates further away
        final dateFormat = DateFormat('MMM d'); // e.g., "Jan 15"
        return '${dateFormat.format(this)}, $timeString';
      }
    }
  }

  /// Simple format: "Today, 4:00 PM" or "Jan 15, 4:00 PM"
  String toSimpleFormat() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateToCheck = DateTime(year, month, day);

    final timeFormat = DateFormat('h:mm a');
    final timeString = timeFormat.format(this);

    if (dateToCheck == today) {
      return 'Today, $timeString';
    } else {
      final dateFormat = DateFormat('MMM d');
      return '${dateFormat.format(this)}, $timeString';
    }
  }

  /// Relative format: "2 hours ago", "Yesterday", "Last week"
  String toRelativeFormat() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '${weeks}w ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '${months}mo ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '${years}y ago';
    }
  }

  /// Time only: "4:00 PM"
  String toTimeOnly() {
    return DateFormat('h:mm a').format(this);
  }

  /// Date only: "Jan 15, 2025"
  String toDateOnly() {
    return DateFormat('MMM d, y').format(this);
  }

  /// Full format: "Monday, January 15, 2025 at 4:00 PM"
  String toFullFormat() {
    return DateFormat('EEEE, MMMM d, y \'at\' h:mm a').format(this);
  }

  /// Short date: "Jan 15"
  String toShortDate() {
    return DateFormat('MMM d').format(this);
  }

  /// ISO date: "2025-01-15"
  String toISODate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  /// Custom format with pattern
  String toCustomFormat(String pattern) {
    return DateFormat(pattern).format(this);
  }

  /// Check if date is today
  bool get isToday {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateToCheck = DateTime(year, month, day);
    return dateToCheck == today;
  }

  /// Check if date is yesterday
  bool get isYesterday {
    final now = DateTime.now();
    final yesterday = DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(const Duration(days: 1));
    final dateToCheck = DateTime(year, month, day);
    return dateToCheck == yesterday;
  }

  /// Check if date is tomorrow
  bool get isTomorrow {
    final now = DateTime.now();
    final tomorrow = DateTime(
      now.year,
      now.month,
      now.day,
    ).add(const Duration(days: 1));
    final dateToCheck = DateTime(year, month, day);
    return dateToCheck == tomorrow;
  }

  /// Check if date is this week
  bool get isThisWeek {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    return isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
        isBefore(endOfWeek.add(const Duration(days: 1)));
  }

  /// Get time ago in words
  String get timeAgo {
    return toRelativeFormat();
  }

  /// For news/social media timestamp
  String get socialTimestamp {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inMinutes < 1) {
      return 'now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d';
    } else {
      return toShortDate();
    }
  }
}
