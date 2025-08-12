import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/src/core/translation/extention.dart';
import 'package:techara_merchant/src/core/widgets/custom_drop_down.dart';
import 'package:techara_merchant/src/main/certificate/presentation/widgets/step_container.dart';

class LanguageStep extends StatelessWidget {
  const LanguageStep({
    Key? key,
    required this.onSelectLanguage,
    required this.selectedLanguage,
  }) : super(key: key);
  final Function(String) onSelectLanguage;

  final TextEditingController selectedLanguage;
  @override
  Widget build(BuildContext context) {
    return StepContainer(
      title: 'إنشاء شهادة منشأ'.tr(selectedLanguage.text),
      subtitle: 'قم باختيار لغة شهادة المنشأ'.tr(selectedLanguage.text),
      child: Column(
        children: [
          // Logo placeholder
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(60),
            ),
            child: Icon(
              PhosphorIcons.certificate(),
              size: 60,
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 32),

          CustomDropDownField(
            label: 'اللغة'.tr(selectedLanguage.text),
            controller: selectedLanguage,
            items: ['اللغة العربية', 'English'],
            onChanged: (value) => onSelectLanguage(value ?? ''),
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red.shade200),
            ),
            child: Text(
              'عزيزي المقدم! إذا كنت تصدر منتجك إلى الدول الجنبية أختر اللغة الإنكليزية وإذا كنت تصدر منتجك إلى الدول العربية أختر اللغة العربية'
                  .tr(selectedLanguage.text),
              style: TextStyle(
                color: Colors.red.shade700,
                fontSize: 14,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
