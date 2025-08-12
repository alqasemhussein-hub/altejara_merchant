import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/src/core/style/theme/cache_theme.dart';
import 'package:techara_merchant/src/core/translation/extention.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/create_certificate/create_certificate_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/widgets/step_container.dart';
import 'package:techara_merchant/utils/injector.dart';

class SourceDetailsStep extends StatelessWidget {
  const SourceDetailsStep({
    super.key,
    required this.notificationNumberController,
    required this.tradeNameController,
    required this.authorizedManagerController,
    required this.sourceAddressController,
  });
  final TextEditingController notificationNumberController;
  final TextEditingController tradeNameController;
  final TextEditingController authorizedManagerController;
  final TextEditingController sourceAddressController;

  @override
  Widget build(BuildContext context) {
    final lang = context.read<CreateCertificateCubit>().selectedLanguage.text;
    return StepContainer(
      title: 'تفاصيل المصدر'.tr(lang),
      child: Column(
        children: [
          _buildTextLabled(
            label: 'رقم الاضبارة'.tr(lang),
            value: notificationNumberController.text,
          ),
          const SizedBox(height: 16),
          _buildTextLabled(
            label: 'الاسم التجاري'.tr(lang),
            value: tradeNameController.text,
          ),
          const SizedBox(height: 16),
          _buildTextLabled(
            label: 'المدير المفوض'.tr(lang),
            value: authorizedManagerController.text,
          ),
          const SizedBox(height: 16),
          _buildTextLabled(
            label: 'عنوان المصدر'.tr(lang),
            value: sourceAddressController.text,
          ),
        ],
      ),
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
              color: getIt<ThemeService>().colorScheme.secondary,
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
