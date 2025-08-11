import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/widgets/custom_drop_down.dart';
import 'package:techara_merchant/src/core/widgets/custom_text_field.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/register/register_cubit.dart';

class AzbaraStep extends StatefulWidget {
  final TextEditingController classNumberController;
  final TextEditingController letterController;
  final VoidCallback onNext;

  AzbaraStep({
    required this.classNumberController,
    required this.letterController,
    required this.onNext,
  });

  @override
  _AzbaraStepState createState() => _AzbaraStepState();
}

class _AzbaraStepState extends State<AzbaraStep> {
  final _formKey = GlobalKey<FormState>();
  String selectedClassification = '';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    'واجهة التحقق',
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),

                  Text(
                    'قم بإدخال رقم الصنف',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'ادخل رقم الصنف الموجود في هوية غرفة تجارة بغداد',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  // Classification input
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomDropDownField(
                          label: 'الحرف',
                          controller: widget.letterController,
                          items: arabicLetterArray,
                          onChanged: (value) {
                            setState(() {
                              selectedClassification = value ?? '';
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: CustomTextForm(
                          controller: widget.classNumberController,
                          keyboardType: TextInputType.number,
                          hintText: 'رقم',
                          title: 'رقم',
                          onValidate: (p0) =>
                              p0?.isEmpty == true ? 'يرجى إدخال رقم' : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Next button
                ],
              ),
            ),

            BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: state.remoteDataState == RemoteDataState.loading
                        ? null
                        : () {
                            if (_formKey.currentState?.validate() ?? false) {
                              context.read<RegisterCubit>().checkClassNumber(
                                widget.letterController.text +
                                    widget.classNumberController.text,
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
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
