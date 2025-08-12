import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/src/core/extenstion/general.dart';
import 'package:techara_merchant/src/core/snackbar/snackbar.dart';
import 'package:techara_merchant/src/core/style/theme/cache_theme.dart';
import 'package:techara_merchant/src/core/translation/extention.dart';
import 'package:techara_merchant/src/core/widgets/image_source_selector.dart';
import 'package:techara_merchant/utils/injector.dart';

class FileSelectorField extends StatefulWidget {
  final String label;
  final Widget? child;
  final String lang;

  final Function(File a)? onFileSelected;

  const FileSelectorField({
    Key? key,
    required this.label,
    this.onFileSelected,
    this.child,
    required this.lang,
  }) : super(key: key);

  @override
  State<FileSelectorField> createState() => _FileSelectorFieldState();
}

class _FileSelectorFieldState extends State<FileSelectorField> {
  File? _selectedFile;
  @override
  Widget build(BuildContext context) {
    return widget.child != null
        ? InkWell(
            onTap: () {
              _pickFile(widget.lang);
            },
            child: widget.child!,
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),

              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black12,
                ),
                child: Column(
                  children: [
                    Icon(
                      PhosphorIcons.cloudArrowUp(),
                      size: 48,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 8),
                    _selectedFile != null
                        ? Image.file(_selectedFile!)
                        : Text(
                            'لم يتم اختيار ملف'.tr(widget.lang),
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => _pickFile(widget.lang),
                      child: Text('اختيار ملف'.tr(widget.lang)),
                    ),
                  ],
                ),
              ),
            ],
          );
  }

  void _pickFile(lang) async {
    final imageSource = await showImageSourceBottomSheet(context);
    if (imageSource == null) return;
    XFile? result = await ImagePicker().pickImage(source: imageSource);
    if (result == null) {
      showWarningSnackBar('يرجى اختيار ملف'.tr(lang));
      return;
    }

    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: result.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'تعديل ',
          toolbarWidgetColor: getIt<ThemeService>().colorScheme.onPrimary,
          toolbarColor: getIt<ThemeService>().colorScheme.primary,
          statusBarColor: getIt<ThemeService>().colorScheme.primary,

          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          showCropGrid: false,
          hideBottomControls: true,
        ),
        IOSUiSettings(
          title: 'تعديل ',
          rotateButtonsHidden: true,
          aspectRatioPickerButtonHidden: true,
          doneButtonTitle: 'تم',
          cancelButtonTitle: 'إلغاء',
        ),
      ],
    );

    if (croppedFile?.path != null) {
      L.info(
        name: 'image compress',
        msg: (await croppedFile!.readAsBytes()).length,
      );

      setState(() {
        _selectedFile = File(croppedFile.path);
      });
      widget.onFileSelected!(_selectedFile!);
    } else {
      showWarningSnackBar('فشل في قص الصورة'.tr(lang));
    }
  }
}
