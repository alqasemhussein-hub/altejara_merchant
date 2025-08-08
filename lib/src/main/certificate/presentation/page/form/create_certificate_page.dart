import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CreateCertificateForm extends StatefulWidget {
  const CreateCertificateForm({super.key});

  @override
  State<CreateCertificateForm> createState() => _CreateCertificateFormState();
}

class _CreateCertificateFormState extends State<CreateCertificateForm>
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
  final _invoiceNumberController = TextEditingController();
  final _invoiceDateController = TextEditingController();
  final _businessNumberController = TextEditingController();
  final _businessCreationDateController = TextEditingController();
  final _businessEndDateController = TextEditingController();
  final _importerNameController = TextEditingController();
  final _importerCountryController = TextEditingController();
  final _importerAddressController = TextEditingController();
  final _notesController = TextEditingController();

  String _selectedLanguage = 'اللغة العربية';
  String _selectedShippingDetails = 'شحن بري';
  String _selectedProduct = 'انتاج زراعي';
  String _selectedCountryOrigin = 'العراق';
  String _selectedLocation = 'بغداد';
  String _selectedMaterialClass = 'ملحقات نفطية خفيفة';
  String _selectedPackageType = 'text';
  double _weight = 1.0;
  String _weightDetails = '';

  PlatformFile? _selectedFile;

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
    _invoiceNumberController.dispose();
    _invoiceDateController.dispose();
    _businessNumberController.dispose();
    _businessCreationDateController.dispose();
    _businessEndDateController.dispose();
    _importerNameController.dispose();
    _importerCountryController.dispose();
    _importerAddressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() {
        _currentStep++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _updateProgress();
    }
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

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('إنشاء شهادة منشأ'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(PhosphorIcons.arrowRight()),
        ),
      ),
      body: Column(
        children: [
          // Progress Header
          _buildProgressHeader(theme),

          // Form Content
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentStep = index;
                });
                _updateProgress();
              },
              children: [
                _buildLanguageStep(),
                _buildSourceDetailsStep(),
                _buildShipmentInfoStep(),
                _buildImporterDetailsStep(),
                _buildSummaryStep(),
                _buildFinalStep(),
                _buildConfirmationStep(),
              ],
            ),
          ),

          // Navigation Buttons
          _buildNavigationButtons(theme),
        ],
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
    return _buildStepContainer(
      title: 'هل أنت متأكد؟',
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
                  'عند ضغطك على كلمة (تأكيد) سوف يتم إرسال بياناتك لغرفة تجارة بغداد',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue.shade700,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'سيتم المباشرة في معاملتك بعد تسديد الأجور',
                  style: TextStyle(fontSize: 14, color: Colors.blue.shade600),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageStep() {
    return _buildStepContainer(
      title: 'إنشاء شهادة منشأ',
      subtitle: 'قم باختيار لغة شهادة المنشأ',
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

          _buildDropdownField(
            label: 'اللغة',
            value: _selectedLanguage,
            items: ['اللغة العربية', 'English'],
            onChanged: (value) {
              setState(() {
                _selectedLanguage = value!;
              });
            },
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
              'عزيزي المقدم! إذا كنت تصدر منتجك إلى الدول الجنبية أختر اللغة الإنكليزية وإذا كنت تصدر منتجك إلى الدول العربية أختر اللغة العربية',
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

  Widget _buildSourceDetailsStep() {
    return _buildStepContainer(
      title: 'تفاصيل المصدر',
      child: Column(
        children: [
          _buildTextField(
            label: 'رقم الإشعارة',
            controller: _notificationNumberController,
            initialValue: '3386g',
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'الاسم التجاري',
            controller: _tradeNameController,
            initialValue: 'شركة واحة الجنوب للمقاولات العامة المحدودة',
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'المدير المفوض',
            controller: _authorizedManagerController,
            initialValue: 'محسن سواري ذويه',
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'عنوان المصدر',
            controller: _sourceAddressController,
            initialValue: 'الكرادة خارج',
          ),
        ],
      ),
    );
  }

  Widget _buildShipmentInfoStep() {
    return _buildStepContainer(
      title: 'معلومات الشحنة',
      child: Column(
        children: [
          _buildTextField(
            label: 'رقم الفاتورة',
            controller: _invoiceNumberController,
            initialValue: '0000000',
          ),
          const SizedBox(height: 16),
          _buildDateField(
            label: 'تاريخ الفاتورة',
            controller: _invoiceDateController,
            initialValue: '08/01/2025',
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'رقم التجارة',
            controller: _businessNumberController,
            initialValue: '1111111',
          ),
          const SizedBox(height: 16),
          _buildDateField(
            label: 'تاريخ إنشاء التجارة',
            controller: _businessCreationDateController,
            initialValue: '08/30/2025',
          ),
          const SizedBox(height: 16),
          _buildDateField(
            label: 'تاريخ انتهاء التجارة',
            controller: _businessEndDateController,
            initialValue: '08/29/2025',
          ),
          const SizedBox(height: 16),
          // File upload
          _buildFileUpload(),
        ],
      ),
    );
  }

  Widget _buildImporterDetailsStep() {
    return _buildStepContainer(
      title: 'تفاصيل المستورد',
      child: Column(
        children: [
          _buildTextField(
            label: 'اسم المستورد',
            controller: _importerNameController,
            initialValue: 'name',
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'البلد المستورد',
            controller: _importerCountryController,
            initialValue: 'الإمارات العربية المتحدة',
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'عنوان المستورد',
            controller: _importerAddressController,
            initialValue: 'text',
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryStep() {
    return _buildStepContainer(
      title: 'تفاصيل المادة',
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildDropdownField(
                  label: 'تفاصيل الشحن',
                  value: _selectedShippingDetails,
                  items: ['شحن بري', 'شحن بحري', 'شحن جوي'],
                  onChanged: (value) {
                    setState(() {
                      _selectedShippingDetails = value!;
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDropdownField(
                  label: 'المنتج وعنوانة كاملة',
                  value: _selectedProduct,
                  items: ['انتاج زراعي', 'انتاج صناعي', 'انتاج حيواني'],
                  onChanged: (value) {
                    setState(() {
                      _selectedProduct = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildDropdownField(
                  label: 'المكان',
                  value: _selectedLocation,
                  items: ['بغداد', 'البصرة', 'الموصل'],
                  onChanged: (value) {
                    setState(() {
                      _selectedLocation = value!;
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDropdownField(
                  label: 'بلد المنشأ',
                  value: _selectedCountryOrigin,
                  items: ['العراق', 'الأردن', 'سوريا'],
                  onChanged: (value) {
                    setState(() {
                      _selectedCountryOrigin = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  label: 'وصف السلع',
                  controller: TextEditingController(text: 'TEXT'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDropdownField(
                  label: 'صنف المادة',
                  value: _selectedMaterialClass,
                  items: ['ملحقات نفطية خفيفة', 'مواد كيميائية', 'مواد غذائية'],
                  onChanged: (value) {
                    setState(() {
                      _selectedMaterialClass = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'نوع التعبئة',
            controller: TextEditingController(text: _selectedPackageType),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildDropdownField(
                  label: 'الوزن القائم',
                  value: 'طن 1',
                  items: ['طن 1', 'كيلو', 'جرام'],
                  onChanged: (value) {
                    setState(() {
                      _weight = double.tryParse(value!.split(' ')[1]) ?? 1.0;
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTextField(
                  label: 'نوع الحكمة',
                  controller: TextEditingController(text: 'طن'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'تفاصيل الوزن',
            controller: TextEditingController(text: 'text'),
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'الملاحظات',
            controller: _notesController,
            initialValue: 'note',
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildFinalStep() {
    return _buildStepContainer(
      title: 'تأكيد البيانات',
      child: Column(
        children: [
          // Summary sections
          _buildSummarySection('تفاصيل المصدر', [
            _buildSummaryItem('رقم الإشعارة:', '3386g'),
            _buildSummaryItem(
              'الاسم التجاري:',
              'شركة واحة الجنوب للمقاولات العامة المحدودة',
            ),
            _buildSummaryItem('المدير المفوض:', 'محسن سواري ذويه'),
            _buildSummaryItem('عنوان المصدر:', 'الكرادة خارج'),
          ]),

          const SizedBox(height: 16),

          _buildSummarySection('معلومات الشحنة', [
            _buildSummaryItem('رقم الفاتورة:', '0000000'),
            _buildSummaryItem('تاريخ الفاتورة:', '2025-08-01'),
            _buildSummaryItem('رقم التجارة:', '1111111'),
            _buildSummaryItem('تاريخ إنشاء الشهادة:', '2025-08-30'),
            _buildSummaryItem('تاريخ انتهاء التجارة:', '2025-08-29'),
          ]),

          const SizedBox(height: 16),

          _buildSummarySection('تفاصيل المادة', [
            _buildSummaryItem('تفاصيل الشحن:', 'شحن بري'),
            _buildSummaryItem('المنتج وعنوانة كاملة:', 'انتاج زراعي'),
            _buildSummaryItem('بلد المنشأ:', 'العراق'),
            _buildSummaryItem('المكان:', 'بغداد'),
            _buildSummaryItem('وصف السلع:', 'TEXT'),
            _buildSummaryItem('صنف المادة:', 'ملحقات نفطية خفيفة'),
            _buildSummaryItem('نوع التعبئة:', 'text'),
            _buildSummaryItem('الوزن القائم:', 'طن 1'),
            _buildSummaryItem('تفاصيل الوزن:', 'text'),
            _buildSummaryItem('الملاحظات:', 'note'),
          ]),

          const SizedBox(height: 16),

          _buildSummarySection('تفاصيل المستورد', [
            _buildSummaryItem('اسم المستورد:', 'name'),
            _buildSummaryItem('البلد المستورد:', 'الإمارات العربية المتحدة'),
            _buildSummaryItem('عنوان المستورد:', 'text'),
          ]),

          const SizedBox(height: 24),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Column(
              children: [
                Text(
                  'الفاتورة',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'نوع الفاتورة:',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text('B', style: TextStyle(color: Colors.green.shade700)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'المبلغ:',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '173500',
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'المجموع:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '173500',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepContainer({
    required String title,
    String? subtitle,
    required Widget child,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
          ],
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? initialValue,
    int maxLines = 1,
  }) {
    if (initialValue != null) {
      controller.text = initialValue;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField({
    required String label,
    required TextEditingController controller,
    String? initialValue,
  }) {
    if (initialValue != null) {
      controller.text = initialValue;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            suffixIcon: Icon(PhosphorIcons.calendar()),
          ),
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
            );
            if (date != null) {
              controller.text =
                  '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
            }
          },
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          items: items.map((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFileUpload() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المرفقات',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Icon(
                PhosphorIcons.cloudArrowUp(),
                size: 48,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 8),
              Text(
                _selectedFile != null
                    ? _selectedFile!.name
                    : 'No file selected.',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles();
                  if (result != null) {
                    setState(() {
                      _selectedFile = result.files.first;
                    });
                  }
                },
                child: Text('Browse'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummarySection(String title, List<Widget> items) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          ...items,
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
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
                  'السابق',
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
            child: ElevatedButton(
              onPressed: _currentStep == _totalSteps - 1
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_currentStep == _totalSteps - 1)
                    Icon(PhosphorIcons.check(), size: 20)
                  else if (_currentStep == 0)
                    Icon(PhosphorIcons.check(), size: 20)
                  else
                    Icon(PhosphorIcons.arrowLeft(), size: 20),
                  const SizedBox(width: 8),
                  Text(
                    _currentStep == _totalSteps - 1
                        ? 'تأكيد'
                        : _currentStep == 0
                        ? 'تأكيد'
                        : 'التالي',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    // Show success dialog
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
                    Navigator.of(context).pop(); // Go back to previous screen
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
}

// Usage Example
class CertificateFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Certificate Form',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        fontFamily: 'Cairo',
      ),
      home: CreateCertificateForm(),
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
    );
  }
}
