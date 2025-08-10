import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/src/core/style/theme/cache_theme.dart';
import 'package:techara_merchant/src/core/widgets/custom_drop_down.dart';
import 'package:techara_merchant/src/core/widgets/custom_text_field.dart';
import 'package:techara_merchant/src/core/widgets/state_loader.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/certificate_parameter/certificate_parameter_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/create_certificate/create_certificate_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/widgets/step_container.dart';
import 'package:techara_merchant/utils/injector.dart';

class MetalStep extends StatefulWidget {
  const MetalStep({
    super.key,
    required this.notesController,
    required this.quantityController,
    required this.quantityDetailsController,
    required this.fillTypeController,
    required this.itemDescriptionController,
    required this.shipmentTypeController,
    required this.productTypeController,
    required this.itemClassController,
    required this.quantityTypeController,
  });
  final TextEditingController notesController;
  final TextEditingController quantityController;
  final TextEditingController quantityDetailsController;
  final TextEditingController fillTypeController;
  final TextEditingController itemDescriptionController;
  final TextEditingController shipmentTypeController;

  final TextEditingController productTypeController;
  final TextEditingController itemClassController;
  final TextEditingController quantityTypeController;

  @override
  _MetalStepState createState() => _MetalStepState();
}

class _MetalStepState extends State<MetalStep> {
  late CreateCertificateCubit _createCertificateCubit;

  @override
  void initState() {
    super.initState();
    _createCertificateCubit = context.read<CreateCertificateCubit>();
    _loadParameter(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CertificateParameterCubit, CertificateParameterState>(
      builder: (context, parameterState) {
        return StateLoader(
          onReload: () => _loadParameter(context),
          state: parameterState.state,

          child: StepContainer(
            title: 'تفاصيل المادة',
            child: Column(
              spacing: 16,
              children: [
                CustomDropDownField(
                  label: 'تفاصيل الشحن',
                  controller: widget.shipmentTypeController,
                  items: parameterState.certificateParams!.generationTypes
                      .map((e) => e.dscrp)
                      .toList(),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),

                CustomDropDownField(
                  label: 'المنتج وعنوانة كاملاً',
                  controller: widget.productTypeController,
                  items: parameterState.certificateParams!.productTypes
                      .map((e) => e.dscrp)
                      .toList(),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),

                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: _buildTextLabled(
                        label: 'بلد المنشأ',
                        value: 'العراق',
                      ),
                    ),
                    Expanded(
                      child: _buildTextLabled(label: 'المكان', value: 'بغداد'),
                    ),
                  ],
                ),

                // const SizedBox(height: 16),
                CustomDropDownField(
                  label: 'صنف المادة',
                  controller: widget.itemClassController,
                  items: parameterState.certificateParams!.itemClasses
                      .map((e) => e.dscrpA)
                      .toList(),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                _buildTextField(
                  label: 'وصف السلع',
                  controller: widget.itemDescriptionController,
                ),

                _buildTextField(
                  label: 'نوع التعبئة',
                  controller: widget.fillTypeController,
                ),

                CustomDropDownField(
                  label: 'نوع الكمية',
                  controller: widget.quantityTypeController,
                  items: parameterState.certificateParams!.stockUnits
                      .map((e) => e.dscrp)
                      .toList(),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),

                _buildNumberField(
                  label: 'الوزن القائم',
                  controller: widget.quantityController,
                ),

                _buildTextField(
                  label: 'تفاصيل الوزن',
                  controller: widget.quantityDetailsController,
                ),

                _buildTextField(
                  label: 'الملاحظات',
                  controller: widget.notesController,

                  maxLines: 3,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _loadParameter(BuildContext context) {
    context.read<CertificateParameterCubit>().getCertificateParameter(
      _createCertificateCubit.selectedLanguage.text == 'اللغة العربية'
          ? 'A'
          : 'E',
    );
  }

  _buildTextField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
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
          hintText: 'أدخل $label',

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

  _buildNumberField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
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

  _buildTextLabled({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: getIt<ThemeService>().colorScheme.surfaceContainerLow,
            border: Border.all(
              color: getIt<ThemeService>().colorScheme.secondary.withAlpha(50),
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            value,
            style: getIt<ThemeService>().textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
