import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/widgets/custom_date_field.dart';
import 'package:techara_merchant/src/core/widgets/custom_text_field.dart';
import 'package:techara_merchant/src/core/widgets/file_selector_field.dart';
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
    return BlocBuilder<UploadFileCubit, UploadFileState>(
      builder: (context, state) {
        return StepContainer(
          loading: state.remoteDataState == RemoteDataState.loading,
          title: 'معلومات الشحنة',
          child: Column(
            children: [
              _buildTextField(
                label: 'رقم الفاتورة',
                controller: certificateNumberController,
              ),
              const SizedBox(height: 16),
              CustomDateField(
                label: 'تاريخ الفاتورة',
                controller: certificateDateController,
                hintText: 'اختر تاريخ الفاتورة',
                onValidate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال تاريخ الفاتورة';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'رقم الاجازة',
                controller: registerNumberController,
              ),
              const SizedBox(height: 16),
              CustomDateField(
                label: 'تاريخ إنشاء الاجازة',
                controller: registerCreateDateController,
                hintText: 'اختر تاريخ إنشاء الاجازة',
                onValidate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال تاريخ إنشاء الاجازة';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomDateField(
                label: 'تاريخ انتهاء الاجازة',
                controller: registerExpDateController,
                hintText: 'اختر تاريخ انتهاء الاجازة',
                onValidate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال تاريخ انتهاء الاجازة';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // File upload
              FileSelectorField(
                label: 'الفاتورة',
                onFileSelected: onFileSelected,
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
          hintText: 'أدخل $label',
          keyboardType: TextInputType.number,
          onValidate: (value) {
            if (value == null || value.isEmpty) {
              return 'يرجى إدخال $label';
            }
            return null;
          },
        ),
      ],
    );
  }
}
