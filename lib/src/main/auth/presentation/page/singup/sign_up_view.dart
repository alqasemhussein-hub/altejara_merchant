import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/api/export.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/snackbar/snackbar.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/otp_login/otp_bloc.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/register/register_cubit.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/login_view.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/singup/azbara_step.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/singup/document_step.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/singup/personal_information_step.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/singup/sign_up_otp_view.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/upload_file/upload_file_cubit.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  int currentStep = 0;
  bool isSheetShow = false;
  PageController pageController = PageController();

  // Controllers for form data
  final classNumberController = TextEditingController();
  final letterController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final residentialAddressController = TextEditingController();
  final workAddressController = TextEditingController();
  final workAddressEnglishController = TextEditingController();
  final factoryAddressController = TextEditingController();
  final otpControllers = List.generate(6, (index) => TextEditingController());

  @override
  void dispose() {
    pageController.dispose();
    classNumberController.dispose();
    letterController.dispose();
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
    if (currentStep == 3) {
      _sendOrder();
    }
  }

  void _sendOrder() {
    context.read<OtpCubit>().setLoading(RemoteDataState.loading);
    context.read<RegisterCubit>().submitData(
      UserOrderForm(
        azbaraNum: letterController.text + classNumberController.text,

        name: nameController.text,
        email: emailController.text,
        phoneNumber: phoneController.text,
        jobAdressA: workAddressController.text,
        jobAdressE: workAddressEnglishController.text,
        address: residentialAddressController.text,
        documents: context.read<UploadFileCubit>().state.otherFilePath,
        image: context
            .read<UploadFileCubit>()
            .state
            .uploadCertificateFileResponse!,
        password: '',
        goveId: 3,
      ),
    );
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
    final TextTheme textTheme = Theme.of(context).textTheme;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.remoteDataState == RemoteDataState.subSuccess) {
          nextStep();
        } else if (state.remoteDataState == RemoteDataState.error) {
          handleError(state.errorMessage);
        }
        if (state.remoteDataState == RemoteDataState.loaded) {
          context.read<OtpCubit>().setLoading(RemoteDataState.subSuccess);
          if (!isSheetShow) {
            openSheet(
              context,
              BlocProvider.value(
                value: context.read<OtpCubit>(),
                child: GeneralOtpVerfityView(
                  title: 'تأكيد الرمز',
                  onVerifySuccess: () {
                    Future.delayed(const Duration(seconds: 2), () {
                      navigatorKey.currentState?.pop();
                      navigatorKey.currentState?.pop();
                    });
                  },

                  onVerify: (otpCode) {
                    context.read<OtpCubit>().confirmOtp(
                      email: emailController.text.trim(),
                      otpCode: otpCode,
                    );
                  },
                  email: emailController.text.trim(),
                  onResend: () => _sendOrder(),
                ),
              ),
            );
          }
          isSheetShow = true;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 90,
            title: Text('تسجيل حساب جديد'),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/logo.png'),
              ),
            ],
          ),
          body: SafeArea(
            child: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                AzbaraStep(
                  classNumberController: classNumberController,
                  letterController: letterController,
                  onNext: nextStep,
                ),
                PersonalInfoStep(
                  nameController: nameController,
                  emailController: emailController,
                  phoneController: phoneController,

                  residentialAddressController: residentialAddressController,
                  workAddressController: workAddressController,
                  workAddressEnglishController: workAddressEnglishController,
                  factoryAddressController: factoryAddressController,
                  onNext: nextStep,
                  onPrevious: previousStep,
                ),

                Step3DocumentUpload(onNext: nextStep, onPrevious: previousStep),
                state.remoteDataState == RemoteDataState.error &&
                        currentStep == 3
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 12,
                          children: [
                            Text(
                              'خطآ في رفع بيانات التاجر',
                              style: textTheme.titleLarge,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                _sendOrder();
                              },
                              label: Text('إعادة المحاولة'),
                              icon: Icon(Icons.refresh),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                previousStep();
                              },
                              label: Text('إعادة sss'),
                              icon: Icon(Icons.refresh),
                            ),
                          ],
                        ),
                      )
                    : state.remoteDataState == RemoteDataState.loading &&
                          currentStep == 3
                    ? Center(child: CircularProgressIndicator())
                    : Center(
                        child: ElevatedButton.icon(
                          onPressed: () => _sendOrder(),
                          label: Text('اعادة ارسال الرمز'),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  void handleError(String? errorMessage) {
    switch (currentStep) {
      case 0:
        showErrorSnackBar(errorMessage ?? 'رقم الاضبارة غير موجود');
        break;
      case 1:
        showErrorSnackBar(
          errorMessage ?? ' رقم الهاتف او البريد الإلكتروني  مسجل',
        );
        break;
      case 3:
        showErrorSnackBar('فشل رفع معلومات التاجر');
      default:
    }
  }
}
