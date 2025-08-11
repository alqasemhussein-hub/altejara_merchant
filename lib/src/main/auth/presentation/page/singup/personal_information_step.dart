import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/widgets/custom_text_field.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/register/register_cubit.dart';

class PersonalInfoStep extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController residentialAddressController;
  final TextEditingController workAddressController;
  final TextEditingController workAddressEnglishController;
  final TextEditingController factoryAddressController;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final _formKey = GlobalKey<FormState>();

  PersonalInfoStep({
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.residentialAddressController,
    required this.workAddressController,
    required this.factoryAddressController,
    required this.onNext,
    required this.onPrevious,
    required this.workAddressEnglishController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'المعلومات الشخصية',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    _buildTextField(
                      controller: nameController,
                      label: 'الاسم الثلاثي (باللغة العربية)',
                      hint: '',
                    ),
                    SizedBox(height: 16),
                    _buildTextField(
                      controller: emailController,
                      label: 'البريد الإلكتروني (مفعل)',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16),
                    _buildTextField(
                      controller: phoneController,
                      label: 'رقم الهاتف (يحتوي واتساب)',
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 16),
                    _buildTextField(
                      controller: residentialAddressController,
                      label: 'عنوان السكن (التفصيلي)',
                    ),
                    SizedBox(height: 16),
                    _buildTextField(
                      controller: workAddressController,
                      label: 'عنوان العمل (التفصيلي)',
                    ),
                    SizedBox(height: 16),
                    _buildTextField(
                      controller: workAddressEnglishController,
                      label: 'عنوان العمل (الانكليزي)',
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
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed:
                            state.remoteDataState == RemoteDataState.loading
                            ? null
                            : () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  context.read<RegisterCubit>().validateData(
                                    emailController.text,
                                    phoneController.text,
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    TextInputType? keyboardType,
  }) {
    return CustomTextForm(
      controller: controller,
      title: label,
      hintText: hint,
      keyboardType: keyboardType,
      onValidate: (p0) {
        if (p0 == null || p0.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
    );
  }
}
