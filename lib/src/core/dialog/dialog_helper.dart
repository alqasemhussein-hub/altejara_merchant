import 'package:flutter/material.dart';

class ConfirmationDialog extends StatefulWidget {
  final String title;
  final String? message;

  final String cancelText;

  final VoidCallback? onCancel;

  final Color? cancelButtonColor;

  final Color? cancelTextColor;
  final IconData? icon;
  final Color? iconColor;

  const ConfirmationDialog({
    super.key,
    required this.title,
    this.message,

    this.cancelText = 'Cancel',

    this.onCancel,

    this.cancelButtonColor,

    this.cancelTextColor,
    this.icon,
    this.iconColor,
  });

  @override
  State<ConfirmationDialog> createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final cancelButtonColor =
        widget.cancelButtonColor ?? colorScheme.secondaryContainer;
    final cancelTextColor =
        widget.cancelTextColor ?? colorScheme.onSecondaryContainer;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: (widget.iconColor)?.withAlpha(26),
                  shape: BoxShape.circle,
                ),
                child: Icon(widget.icon!, size: 32, color: widget.iconColor),
              ),
              const SizedBox(height: 16),
            ],
            if (widget.icon == null) const SizedBox(height: 16),
            // Title
            Text(
              widget.title,
              style: textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            widget.message != null ? const SizedBox(height: 12) : SizedBox(),

            // Message
            widget.message != null
                ? Text(
                    widget.message ?? '',
                    style: textTheme.bodyMedium!.copyWith(
                      color: colorScheme.onSurfaceVariant.withAlpha(204),
                    ),
                  )
                : SizedBox(),

            const SizedBox(height: 24),

            // Buttons
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(widget.cancelText),
              style: ElevatedButton.styleFrom(
                backgroundColor: cancelButtonColor,
                foregroundColor: cancelTextColor,
                textStyle: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper function to show the dialog
class DialogHelper {
  // Save Changes Dialog
  static void showWariningDialog(
    BuildContext context, {
    required String message,

    VoidCallback? onCancel,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ConfirmationDialog(
        title: 'تنبيه',
        message: message,

        cancelText: 'إلغاء',

        onCancel: onCancel,
        icon: Icons.warning,
        iconColor: Colors.amber,
      ),
    );
  }

  static void showSuccessDialog(
    BuildContext context, {
    required String message,

    VoidCallback? onCancel,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ConfirmationDialog(
        title: 'نجح',
        message: message,

        cancelText: 'إلغاء',

        onCancel: onCancel,
        icon: Icons.check,
        iconColor: Colors.green,
      ),
    );
  }

  static void showErrorDialog(
    BuildContext context, {
    required String message,

    VoidCallback? onCancel,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ConfirmationDialog(
        title: 'فشل',
        message: message,

        cancelText: 'إلغاء',

        onCancel: onCancel,
        icon: Icons.cancel,
        iconColor: Colors.red,
      ),
    );
  }
}

// Usage Examples:
/*
// Delete Account
DialogHelper.showDeleteAccountDialog(
  context,
  onConfirm: () {
    // Delete account logic
    print('Account deleted');
  },
);

// Logout
DialogHelper.showLogoutDialog(
  context,
  onConfirm: () {
    // Logout logic
    print('Logged out');
  },
);

// Delete Item
DialogHelper.showDeleteItemDialog(
  context,
  itemName: 'الفاتورة',
  onConfirm: () {
    // Delete item logic
    print('Item deleted');
  },
);

// Custom Dialog
DialogHelper.showCustomDialog(
  context,
  title: 'عنوان مخصص',
  message: 'رسالة مخصصة هنا',
  confirmText: 'نعم',
  cancelText: 'لا',
  icon: Icons.info,
  iconColor: Colors.blue,
  onConfirm: () {
    print('Custom action confirmed');
  },
);
*/
