import 'package:flutter/material.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/singup/azbara_step.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/singup/document_step.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/singup/otp_step.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/singup/personal_information_step.dart';

class SignUpView extends StatefulWidget {
  final Function onLoginChange;
  const SignUpView({super.key, required this.onLoginChange});

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  int currentStep = 0;
  PageController pageController = PageController();

  // Controllers for form data
  final classificationController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final residentialAddressController = TextEditingController();
  final workAddressController = TextEditingController();
  final factoryAddressController = TextEditingController();
  final otpControllers = List.generate(6, (index) => TextEditingController());

  @override
  void dispose() {
    pageController.dispose();
    classificationController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    residentialAddressController.dispose();
    workAddressController.dispose();
    factoryAddressController.dispose();
    otpControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void nextStep() {
    if (currentStep < 3) {
      setState(() {
        currentStep++;
      });
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Progress indicator
          Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index <= currentStep
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey[300],
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: index <= currentStep
                                ? Colors.white
                                : Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    if (index < 3)
                      Container(width: 40, height: 2, color: Colors.grey[300]),
                  ],
                );
              }),
            ),
          ),
          // Page content
          Expanded(
            child: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                AzbaraStep(
                  classificationController: classificationController,
                  onNext: nextStep,
                ),
                PersonalInfoStep(
                  nameController: nameController,
                  emailController: emailController,
                  phoneController: phoneController,
                  residentialAddressController: residentialAddressController,
                  workAddressController: workAddressController,
                  factoryAddressController: factoryAddressController,
                  onNext: nextStep,
                  onPrevious: previousStep,
                ),
                Step3DocumentUpload(onNext: nextStep, onPrevious: previousStep),
                Step4OtpVerification(
                  otpControllers: otpControllers,
                  onPrevious: previousStep,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
