import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/src/core/translation/extention.dart';
import 'package:techara_merchant/src/core/widgets/custom_drop_down.dart';
import 'package:techara_merchant/src/core/widgets/custom_text_field.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/certificate_parameter/certificate_parameter_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/create_certificate/create_certificate_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/widgets/step_container.dart';

class ImporterDetailsStep extends StatelessWidget {
  const ImporterDetailsStep({
    super.key,
    required this.importerNameController,
    required this.importerCountryController,
    required this.importerAddressController,
  });
  final TextEditingController importerNameController;
  final TextEditingController importerCountryController;
  final TextEditingController importerAddressController;

  @override
  Widget build(BuildContext context) {
    final lang = context.read<CreateCertificateCubit>().selectedLanguage.text;
    return StepContainer(
      title: 'تفاصيل المستورد'.tr(lang),
      child: Column(
        children: [
          _buildTextField(
            label: 'اسم المستورد'.tr(lang),
            controller: importerNameController,
            lang: lang,
          ),
          const SizedBox(height: 16),

          CustomDropDownField(
            label: 'البلد المستورد'.tr(lang),
            controller: importerCountryController,
            hint: 'اختر'.tr(lang),
            errorText: 'يرجى اختيار بلد المستورد'.tr(lang),
            items: context
                .read<CertificateParameterCubit>()
                .state
                .certificateParams!
                .countries
                .map((e) => lang == 'اللغة العربية' ? e.dscrpA : e.dscrpE)
                .toList(),

            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'عنوان المستورد'.tr(lang),
            controller: importerAddressController,
            lang: lang,
          ),
        ],
      ),
    );
  }

  _buildTextField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
    lang,
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
          maxLines: maxLines,
          controller: controller,
          hintText: '${'أدخل'.tr(lang)} $label',

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
