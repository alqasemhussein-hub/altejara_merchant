import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// This is a custom widget for the bottom sheet options
class ImageSourceBottomSheet extends StatelessWidget {
  const ImageSourceBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'اختر مصدر الصورة',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSourceOption(
                context,
                icon: PhosphorIcons.camera(),
                label: 'الكاميرا',
                onTap: () => Navigator.of(context).pop(ImageSource.camera),
              ),
              _buildSourceOption(
                context,
                icon: PhosphorIcons.image(),
                label: 'المعرض',
                onTap: () => Navigator.of(context).pop(ImageSource.gallery),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSourceOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                size: 40,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 8),
            Text(label, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}

// Function to show the bottom sheet
Future<ImageSource?> showImageSourceBottomSheet(BuildContext context) async {
  return await showModalBottomSheet<ImageSource>(
    context: context,
    builder: (context) => const ImageSourceBottomSheet(),
  );
}
