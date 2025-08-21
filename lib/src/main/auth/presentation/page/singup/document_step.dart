import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/snackbar/snackbar.dart';
import 'package:techara_merchant/src/core/widgets/file_selector_field.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/upload_file/upload_file_cubit.dart';

class Step3DocumentUpload extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  Step3DocumentUpload({required this.onNext, required this.onPrevious});

  @override
  _Step3DocumentUploadState createState() => _Step3DocumentUploadState();
}

class _Step3DocumentUploadState extends State<Step3DocumentUpload> {
  List<File?> uploadedFiles = [null, null, null, null];
  List<String> fileLabels = [
    'صورة هوية غرفة التجارة أمامية',
    'صورة هوية غرفة التجارة خلفية',
    'صورة بطاقة الموحدة أمامية',
    'صورة بطاقة الموحدة خلفية',
  ];
  File? profileImage;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadFileCubit, UploadFileState>(
      listener: (context, state) {
        if (state.remoteDataState == RemoteDataState.loaded) {
          widget.onNext();
          showSuccessSnackBar('تم رفع الملفات بنجاح');
        }
      },
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              'الصور المطلوبة',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Profile icon
            FileSelectorField(
              lang: 'ar',
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    profileImage != null
                        ? CircleAvatar(
                            radius: 40,
                            backgroundImage: FileImage(profileImage!),
                          )
                        : Icon(Icons.person, size: 40, color: Colors.grey[600]),
                    Icon(Icons.person, size: 40, color: Colors.grey[600]),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              label: 'صورة الملف الشخصي',
              onFileSelected: (a) {
                setState(() {
                  profileImage = a;
                });
              },
            ),

            SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: _buildFileUploadField(index),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Navigation buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: widget.onPrevious,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'السابق',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: BlocBuilder<UploadFileCubit, UploadFileState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed:
                            state.remoteDataState == RemoteDataState.loading
                            ? null
                            : () {
                                if (uploadedFiles.any((file) => file == null) ||
                                    profileImage == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'الرجاء تحميل جميع الملفات',
                                      ),
                                    ),
                                  );
                                  return;
                                } else {
                                  // Submit the files
                                  context
                                      .read<UploadFileCubit>()
                                      .uploadRegistrationFiles(
                                        profileImage!,
                                        uploadedFiles
                                            .map((file) => file!)
                                            .toList(),
                                      );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: state.remoteDataState == RemoteDataState.loading
                            ? CircularProgressIndicator()
                            : Text(
                                'التالي',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileUploadField(int index) {
    return FileSelectorField(
      lang: 'ar',
      label: fileLabels[index],
      onFileSelected: (file) {
        setState(() {
          uploadedFiles[index] = file;
        });
      },
    );
  }
}
