import 'package:flutter/material.dart';

class PersonalInfoStep extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController residentialAddressController;
  final TextEditingController workAddressController;
  final TextEditingController factoryAddressController;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  PersonalInfoStep({
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.residentialAddressController,
    required this.workAddressController,
    required this.factoryAddressController,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(
            'المعلومات الشخصية',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildTextField(
                    controller: nameController,
                    label: 'الاسم الثلاثي (باللغة العربية)',
                    hint: 'محمد',
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: emailController,
                    label: 'البريد الإلكتروني (اختياري)',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: phoneController,
                    label: 'رقم الهاتف (يبدأ ب وتساب)',
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: residentialAddressController,
                    label: 'عنوان السكن التفصيلي',
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: workAddressController,
                    label: 'عنوان العمل التفصيلي',
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: factoryAddressController,
                    label: 'عنوان العمل الاستثماري',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          // Navigation buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onPrevious,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'السابق',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: onNext,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'التالي',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }
}
