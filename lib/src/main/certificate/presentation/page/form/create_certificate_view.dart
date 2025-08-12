import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/api/models/certificate/add_certifecate_request.dart';
import 'package:techara_merchant/api/models/certificate/certificate_data_item.dart';
import 'package:techara_merchant/api/models/certificate/create_certificate/create_certificate_extention.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/snackbar/snackbar.dart';
import 'package:techara_merchant/src/core/translation/extention.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/certificate_parameter/certificate_parameter_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/create_certificate/create_certificate_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/cubit/payment_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/upload_file/upload_file_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/certificate_detials_view.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/form/steps/importer_step.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/form/steps/language_step.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/form/steps/metal_step.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/form/steps/shipment_step.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/form/steps/sourse_details_step.dart';
import 'package:techara_merchant/src/main/certificate/presentation/widgets/step_container.dart';
import 'package:techara_merchant/src/main/profile/presentation/cubit/profile/profile_cubit.dart';

class CreateCertificateFormView extends StatefulWidget {
  const CreateCertificateFormView({super.key});

  @override
  State<CreateCertificateFormView> createState() =>
      _CreateCertificateFormViewState();
}

class _CreateCertificateFormViewState extends State<CreateCertificateFormView>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  int _currentStep = 0;
  final int _totalSteps = 7;

  // Form controllers
  final _formKey = GlobalKey<FormState>();
  final _notificationNumberController = TextEditingController();
  final _tradeNameController = TextEditingController();
  final _authorizedManagerController = TextEditingController();
  final _sourceAddressController = TextEditingController();
  final _certificateNumberController = TextEditingController();
  final _certificateDateController = TextEditingController();
  final _registerNumberController = TextEditingController();
  final _registerCreateDateController = TextEditingController();
  final _registerExpDateController = TextEditingController();
  final importerNameController = TextEditingController();
  final importerCountryController = TextEditingController();
  final importerAddressController = TextEditingController();

  final TextEditingController notesController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController quantityDetailsController =
      TextEditingController();
  final TextEditingController fillTypeController = TextEditingController();
  final TextEditingController itemDescriptionController =
      TextEditingController();
  final TextEditingController shipmentTypeController = TextEditingController();

  final TextEditingController productTypeController = TextEditingController();
  final TextEditingController _itemClassController = TextEditingController();
  final TextEditingController quantityTypeController = TextEditingController();

  late ProfileCubit _profileCubit;

  File? _selectedFile;
  late CreateCertificateCubit _createCertificateCubit;
  String? billDoc;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );
    _profileCubit = context.read<ProfileCubit>();
    _notificationNumberController.text =
        _profileCubit.state.userData?.azbaraNum ?? '';
    _createCertificateCubit = context.read<CreateCertificateCubit>();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _progressController.dispose();
    // Dispose all controllers
    _notificationNumberController.dispose();
    _tradeNameController.dispose();
    _authorizedManagerController.dispose();
    _sourceAddressController.dispose();
    _certificateNumberController.dispose();
    _certificateDateController.dispose();
    _registerNumberController.dispose();
    _registerCreateDateController.dispose();
    _registerExpDateController.dispose();
    importerNameController.dispose();
    importerCountryController.dispose();
    importerAddressController.dispose();
    notesController.dispose();
    super.dispose();
  }

  void _nextStep() {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    switch (_currentStep) {
      case 0:
        if (_createCertificateCubit.selectedLanguage.text.isEmpty) {
          showWarningSnackBar('الرجاء اختيار اللغة');
          return;
        }
        if (context.read<CertificateParameterCubit>().state.state !=
            RemoteDataState.loaded) {
          context.read<CertificateParameterCubit>().getCertificateParameter(
            _createCertificateCubit.selectedLanguage.text == 'اللغة العربية'
                ? 'A'
                : 'E',
          );
        }
        _goNext();
        _fillSourceDetails();
        break;
      case 1:
        if (_notificationNumberController.text.isEmpty ||
            _tradeNameController.text.isEmpty ||
            _authorizedManagerController.text.isEmpty ||
            _sourceAddressController.text.isEmpty) {
          showWarningSnackBar('الرجاء ملء جميع الحقول');
          return;
        }
        _goNext();
        break;
      case 2:
        if (_selectedFile == null) {
          showWarningSnackBar('الرجاء اختيار ملف');
          return;
        }
        context.read<UploadFileCubit>().uploadFile(_selectedFile!);

        break;
      case 3:
        // if parameter not loaded must reload to complete create
        if (context.read<CertificateParameterCubit>().state.state !=
            RemoteDataState.loaded) {
          showErrorSnackBar('يجب اعادة تحميل البيانات');
          return;
        }
        _goNext();
        break;
      case 5:
        _goNext();
        break;
      case 6:
        break;
      default:
        _goNext();
    }

    // if (_currentStep < _totalSteps - 1) {
    //   setState(() {
    //     _currentStep++;
    //   });

    //}
  }

  _goNext() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _updateProgress();
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _updateProgress();
    }
  }

  void _updateProgress() {
    _progressController.animateTo((_currentStep + 1) / _totalSteps);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<UploadFileCubit, UploadFileState>(
          listenWhen: (previous, current) =>
              previous.remoteDataState != current.remoteDataState,
          listener: (context, state) {
            if (state.remoteDataState == RemoteDataState.loaded) {
              billDoc = state.uploadFileResponse;
              _goNext();
            } else if (state.remoteDataState == RemoteDataState.error) {
              showErrorSnackBar('حدث خطأ أثناء تحميل الملف');
            }
          },
        ),
        BlocListener<CreateCertificateCubit, CreateCertificateState>(
          listenWhen: (previous, current) => previous.state != current.state,
          listener: (context, state) {
            if (state.state == RemoteDataState.loaded) {
              _successMessage();
            } else if (state.state == RemoteDataState.error) {
              showErrorSnackBar(state.errorMessage ?? '');
            }
          },
        ),
      ],
      child: Scaffold(
        body: Directionality(
          textDirection:
              _createCertificateCubit.selectedLanguage.text == 'English'
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Progress Header
                _buildProgressHeader(theme),

                // Form Content
                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    itemCount: _totalSteps,
                    onPageChanged: (index) {
                      setState(() {
                        _currentStep = index;
                      });
                      _updateProgress();
                    },
                    itemBuilder: (context, index) {
                      // Use a switch statement to return the correct widget for each step
                      switch (index) {
                        case 0:
                          return LanguageStep(
                            key: ValueKey('LanguageStep'), // Add a unique key
                            selectedLanguage:
                                _createCertificateCubit.selectedLanguage,
                            onSelectLanguage: (value) {
                              _createCertificateCubit.setLanguage(value);
                              setState(() {});
                            },
                          );
                        case 1:
                          return SourceDetailsStep(
                            key: ValueKey(
                              'SourceDetailsStep',
                            ), // Add a unique key
                            notificationNumberController:
                                _notificationNumberController,
                            tradeNameController: _tradeNameController,
                            authorizedManagerController:
                                _authorizedManagerController,
                            sourceAddressController: _sourceAddressController,
                          );
                        case 2:
                          return ShipmentStep(
                            key: ValueKey('ShipmentStep'), // Add a unique key
                            certificateNumberController:
                                _certificateNumberController,
                            certificateDateController:
                                _certificateDateController,
                            registerNumberController: _registerNumberController,
                            registerCreateDateController:
                                _registerCreateDateController,
                            registerExpDateController:
                                _registerExpDateController,
                            onFileSelected: (v) {
                              setState(() {
                                _selectedFile = v;
                              });
                            },
                          );
                        case 3:
                          return MetalStep(
                            key: ValueKey('MetalStep'), // Add a unique key
                            notesController: notesController,
                            quantityController: quantityController,
                            quantityDetailsController:
                                quantityDetailsController,
                            fillTypeController: fillTypeController,
                            itemDescriptionController:
                                itemDescriptionController,
                            shipmentTypeController: shipmentTypeController,
                            productTypeController: productTypeController,
                            itemClassController: _itemClassController,
                            quantityTypeController: quantityTypeController,
                          );
                        case 4:
                          return ImporterDetailsStep(
                            key: ValueKey(
                              'ImporterDetailsStep',
                            ), // Add a unique key
                            importerNameController: importerNameController,
                            importerCountryController:
                                importerCountryController,
                            importerAddressController:
                                importerAddressController,
                          );
                        case 5:
                          return CertificateDetailsView(
                            language:
                                _createCertificateCubit.selectedLanguage.text,
                            certificate: CertifecateDataItem(
                              certificateId: -1,
                              id: -1,
                              goverId: -1,
                              certificateNo: _certificateNumberController.text,
                              certificateDate: _certificateDateController.text,
                              regNo: _registerNumberController.text,
                              regDate: _registerCreateDateController.text,
                              expDate: _registerExpDateController.text,
                              generationDscrp: shipmentTypeController.text,
                              productDscrp: productTypeController.text,
                              detailsDscrp: itemDescriptionController.text,
                              detailsTypeDscrp: fillTypeController.text,
                              wigthNum:
                                  double.tryParse(quantityController.text) ??
                                  0.0,
                              wigth: quantityTypeController.text,
                              wigthDetails: quantityDetailsController.text,
                              notes: notesController.text,
                              targetAddress: importerAddressController.text,
                              targetName: importerNameController.text,
                              targetCountry: 0,
                              tranzetCountry: 0,
                              sourceCountry: 'العراق',
                              lang:
                                  _createCertificateCubit
                                          .selectedLanguage
                                          .text ==
                                      'English'
                                  ? 'E'
                                  : 'A',
                              orderNo: '',
                              amount: 0,
                              state: -1,
                              operationId: 1,
                              operationName: 'غير مرسل',
                            ),
                            targetCountry: importerCountryController.text,
                          );

                        case 6:
                          return _buildConfirmationStep();
                        default:
                          return const SizedBox.shrink(); // A safe fallback
                      }
                    },
                  ),
                ),

                // Navigation Buttons
                _buildNavigationButtons(theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressHeader(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        children: [
          // Step Indicators
          Row(
            children: List.generate(_totalSteps, (index) {
              return Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index <= _currentStep
                            ? theme.colorScheme.primary
                            : Colors.grey.shade300,
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: index <= _currentStep
                                ? Colors.white
                                : Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    if (index < _totalSteps - 1)
                      Expanded(
                        child: Container(
                          height: 2,
                          color: index < _currentStep
                              ? theme.colorScheme.primary
                              : Colors.grey.shade300,
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),

          const SizedBox(height: 16),

          // Progress Bar
          AnimatedBuilder(
            animation: _progressAnimation,
            builder: (context, child) {
              return LinearProgressIndicator(
                value: _progressAnimation.value,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation<Color>(
                  theme.colorScheme.primary,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmationStep() {
    return BlocBuilder<CreateCertificateCubit, CreateCertificateState>(
      builder: (context, state) {
        return StepContainer(
          title: state.state == RemoteDataState.loaded
              ? 'قم بدفع مبلغ الشهادة '.tr(
                  _createCertificateCubit.selectedLanguage.text,
                )
              : 'هل أنت متأكد؟'.tr(
                  _createCertificateCubit.selectedLanguage.text,
                ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  children: [
                    Icon(
                      PhosphorIcons.warning(PhosphorIconsStyle.fill),
                      color: Colors.blue,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.state == RemoteDataState.loaded
                          ? 'اضغط على دفع للمباشرة في معاملتك'.tr(
                              _createCertificateCubit.selectedLanguage.text,
                            )
                          : 'عند ضغطك على كلمة (تأكيد) سوف يتم إرسال بياناتك لغرفة تجارة بغداد'
                                .tr(
                                  _createCertificateCubit.selectedLanguage.text,
                                ),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue.shade700,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    if (state.state != RemoteDataState.loaded)
                      Text(
                        'سيتم المباشرة في معاملتك بعد تسديد الأجور'.tr(
                          _createCertificateCubit.selectedLanguage.text,
                        ),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue.shade600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavigationButtons(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          if (_currentStep > 0)
            Expanded(
              child: OutlinedButton(
                onPressed: _previousStep,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(color: Colors.grey.shade400),
                ),
                child: Text(
                  'السابق'.tr(_createCertificateCubit.selectedLanguage.text),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),

          if (_currentStep > 0) const SizedBox(width: 16),

          Expanded(
            flex: _currentStep == 0 ? 1 : 1,
            child: BlocBuilder<CreateCertificateCubit, CreateCertificateState>(
              builder: (context, state) {
                return state.state == RemoteDataState.loaded
                    ? BlocProvider(
                        create: (context) => PaymentCubit(),
                        child: PaymentButton(
                          title: 'دفع الطلب'.tr(
                            _createCertificateCubit.selectedLanguage.text,
                          ),
                          onSuccess: () {
                            Future.delayed(
                              const Duration(milliseconds: 2000),
                              () {
                                navigatorKey.currentState?.pop();
                              },
                            );
                          },
                          certificate: state.certificates!
                              .toCertifecateDataItem(),
                        ),
                      )
                    : ElevatedButton.icon(
                        onPressed: state.state == RemoteDataState.loading
                            ? null
                            : _currentStep == _totalSteps - 1
                            ? _submitForm
                            : _nextStep,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                        ),

                        label: Text(
                          _currentStep == _totalSteps - 1
                              ? 'تأكيد'.tr(
                                  _createCertificateCubit.selectedLanguage.text,
                                )
                              : _currentStep == 0
                              ? 'تأكيد'.tr(
                                  _createCertificateCubit.selectedLanguage.text,
                                )
                              : 'التالي'.tr(
                                  _createCertificateCubit.selectedLanguage.text,
                                ),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        icon: state.state == RemoteDataState.loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : (_currentStep == _totalSteps - 1)
                            ? Icon(PhosphorIcons.check(), size: 20)
                            : (_currentStep == 0)
                            ? Icon(PhosphorIcons.check(), size: 20)
                            : Icon(PhosphorIcons.arrowRight(), size: 20),
                        iconAlignment: IconAlignment.end,
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (billDoc == null || billDoc!.isEmpty) {
      showWarningSnackBar('الرجاء تحميل المستندات المطلوبة');
      return;
    }
    _createCertificateCubit.createFormSubmit(
      AddCertifecateRequest(
        serviceId: '1',
        lang: _createCertificateCubit.selectedLanguage.text == 'English'
            ? 'E'
            : 'A',
        certificateDate: _certificateDateController.text,
        certificateNo: _certificateNumberController.text,
        regDate: _registerCreateDateController.text,
        regNo: _registerNumberController.text,
        expDate: _registerExpDateController.text,
        countryID: _getCountryId(),
        countryName: importerCountryController.text,
        targetName: importerNameController.text,
        targetAddress: _sourceAddressController.text,
        itemsClassID: _getItemsClassId(),
        generationDscrp: shipmentTypeController.text,
        productDscrp: productTypeController.text,
        detailsDscrp: itemDescriptionController.text,
        detailsTypeDscrp: fillTypeController.text,
        wigthNum: quantityController.text,
        wigth: quantityTypeController.text,
        wigthDetails: quantityDetailsController.text,
        notes: notesController.text,
        billDocs: billDoc!,
      ),
    );
  }

  _successMessage() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
                  color: Colors.green,
                  size: 40,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'تم إرسال الطلب بنجاح!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'سيتم مراجعة طلبك وإرسال النتيجة قريباً',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'موافق',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getCountryId() {
    return context
        .read<CertificateParameterCubit>()
        .state
        .certificateParams!
        .countries
        .firstWhere(
          (country) =>
              country.dscrpA == importerCountryController.text ||
              country.dscrpE == importerCountryController.text,
        )
        .id
        .toString();
  }

  void _fillSourceDetails() {
    _tradeNameController.text =
        _createCertificateCubit.selectedLanguage.text == 'اللغة العربية'
        ? _profileCubit.state.userData?.tajer.arTitle ?? ''
        : _profileCubit.state.userData?.tajer.title ?? '';
    _authorizedManagerController.text =
        _createCertificateCubit.selectedLanguage.text == 'اللغة العربية'
        ? _profileCubit.state.userData?.tajer.aName ?? ''
        : _profileCubit.state.userData?.tajer.eName ?? '';
    _sourceAddressController.text =
        _createCertificateCubit.selectedLanguage.text == 'اللغة العربية'
        ? _profileCubit.state.userData?.tajerComplement.jobAddressA ?? ''
        : _profileCubit.state.userData?.tajerComplement.jobAddressE ?? '';
  }

  _getItemsClassId() {
    return context
        .read<CertificateParameterCubit>()
        .state
        .certificateParams!
        .itemClasses
        .firstWhere(
          (item) =>
              item.dscrpA == _itemClassController.text ||
              item.dscrpE == _itemClassController.text,
        )
        .id
        .toString();
  }
}
