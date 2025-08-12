import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/translation/extention.dart';
import 'package:techara_merchant/src/core/widgets/custom_date_field.dart';
import 'package:techara_merchant/src/core/widgets/custom_text_field.dart';
import 'package:techara_merchant/src/core/widgets/file_selector_field.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/create_certificate/create_certificate_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/upload_file/upload_file_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/widgets/step_container.dart';

class ShipmentStep extends StatelessWidget {
  const ShipmentStep({
    super.key,
    required this.certificateNumberController,
    required this.certificateDateController,
    required this.registerNumberController,
    required this.registerCreateDateController,
    required this.registerExpDateController,
    required this.onFileSelected,
  });

  final TextEditingController certificateNumberController;
  final TextEditingController certificateDateController;
  final TextEditingController registerNumberController;
  final TextEditingController registerCreateDateController;
  final TextEditingController registerExpDateController;
  final Function(File a)? onFileSelected;
  @override
  Widget build(BuildContext context) {
    final lang = context.read<CreateCertificateCubit>().selectedLanguage.text;
    return BlocBuilder<UploadFileCubit, UploadFileState>(
      builder: (context, state) {
        return StepContainer(
          loading: state.remoteDataState == RemoteDataState.loading,
          title: 'معلومات الشحنة'.tr(lang),
          child: Column(
            children: [
              _buildTextField(
                label: 'رقم الفاتورة'.tr(lang),
                controller: certificateNumberController,
                lang: lang,
              ),
              const SizedBox(height: 16),
              CustomDateField(
                label: 'تاريخ الفاتورة'.tr(lang),
                controller: certificateDateController,
                hintText: 'اختر تاريخ الفاتورة'.tr(lang),
                onValidate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال تاريخ الفاتورة'.tr(lang);
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'رقم الاجازة'.tr(lang),
                controller: registerNumberController,
                lang: lang,
              ),
              const SizedBox(height: 16),
              CustomDateField(
                label: 'تاريخ إنشاء الاجازة'.tr(lang),
                controller: registerCreateDateController,
                hintText: 'اختر تاريخ إنشاء الاجازة'.tr(lang),
                onValidate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال تاريخ إنشاء الاجازة'.tr(lang);
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomDateField(
                initialValue: DateTime.now().add(const Duration(days: 1)),
                label: 'تاريخ انتهاء الاجازة'.tr(lang),
                controller: registerExpDateController,
                hintText: 'اختر تاريخ انتهاء الاجازة'.tr(lang),
                onValidate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال تاريخ انتهاء الاجازة'.tr(lang);
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // File upload
              FileSelectorField(
                label: 'الفاتورة'.tr(lang),
                onFileSelected: onFileSelected,
                lang: lang,
              ),
            ],
          ),
        );
      },
    );
  }

  _buildTextField({
    required String label,
    required TextEditingController controller,
    required String lang,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        CustomTextForm(
          controller: controller,
          hintText: '${'أدخل'.tr(lang)} $label',
          keyboardType: TextInputType.number,
          onValidate: (value) {
            if (value == null || value.isEmpty) {
              return '${'يرجى إدخال'.tr(lang)} $label';
            }
            return null;
          },
        ),
      ],
    );
  }
}
