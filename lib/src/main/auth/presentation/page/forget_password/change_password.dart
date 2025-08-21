import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/service/local_storage.dart';
import 'package:techara_merchant/src/core/snackbar/snackbar.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/forget_password/forget_password_cubit.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Password strength indicators
  bool _hasMinLength = false;
  bool _hasUppercase = false;
  bool _hasLowercase = false;
  bool _hasNumbers = false;
  bool _hasSpecialCharacters = false;

  @override
  void initState() {
    super.initState();

    _newPasswordController.addListener(_validatePasswordStrength);
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validatePasswordStrength() {
    final password = _newPasswordController.text;
    setState(() {
      _hasMinLength = password.length >= 8;
      _hasUppercase = password.contains(RegExp(r'[A-Z]'));
      _hasLowercase = password.contains(RegExp(r'[a-z]'));
      _hasNumbers = password.contains(RegExp(r'[0-9]'));
      _hasSpecialCharacters = password.contains(
        RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
      );
    });
  }

  bool get _isPasswordStrong {
    return _hasMinLength;
  }

  Color get _passwordStrengthColor {
    final strengthCount = [_hasMinLength].where((element) => element).length;

    if (strengthCount <= 2) return Colors.red;
    if (strengthCount <= 3) return Colors.orange;
    if (strengthCount <= 4) return Colors.yellow.shade700;
    return Colors.green;
  }

  String get _passwordStrengthText {
    final strengthCount = [
      _hasMinLength,
      _hasUppercase,
      _hasLowercase,
      _hasNumbers,
      _hasSpecialCharacters,
    ].where((element) => element).length;

    if (strengthCount <= 2) return 'ضعيفة';
    if (strengthCount <= 3) return 'متوسطة';
    if (strengthCount <= 4) return 'جيدة';
    return 'قوية جداً';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state.remoteDataState == RemoteDataState.loaded) {
          _showSuccessDialog();
        }
        if (state.remoteDataState == RemoteDataState.error) {
          showErrorSnackBar(
            'فشل في تغيير كلمة المرور. حاول مرة أخرى.',
            context,
          );
        }
      },
      builder: (context, state) {
        return Material(
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              spacing: 10,
              children: [
                // Header Icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        theme.colorScheme.primary,
                        theme.colorScheme.primary.withOpacity(0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.primary.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Icon(
                    PhosphorIcons.lock(PhosphorIconsStyle.fill),
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                Text('تغيير كلمة المرور'),

                // Form Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Current Password Field

                        // New Password Field
                        _buildPasswordField(
                          label: 'كلمة المرور الجديدة',
                          controller: _newPasswordController,
                          isVisible: _isNewPasswordVisible,
                          onVisibilityToggle: () {
                            setState(() {
                              _isNewPasswordVisible = !_isNewPasswordVisible;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى إدخال كلمة المرور الجديدة';
                            }
                            if (!_isPasswordStrong) {
                              return 'كلمة المرور ضعيفة جداً';
                            }
                            return null;
                          },
                        ),

                        // Password Strength Indicator
                        if (_newPasswordController.text.isNotEmpty) ...[
                          const SizedBox(height: 16),
                          _buildPasswordStrengthIndicator(),
                          const SizedBox(height: 8),
                          _buildPasswordRequirements(),
                        ],

                        const SizedBox(height: 24),

                        // Confirm Password Field
                        _buildPasswordField(
                          label: 'تأكيد كلمة المرور الجديدة',
                          controller: _confirmPasswordController,
                          isVisible: _isConfirmPasswordVisible,
                          onVisibilityToggle: () {
                            setState(() {
                              _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى تأكيد كلمة المرور';
                            }
                            if (value != _newPasswordController.text) {
                              return 'كلمة المرور غير متطابقة';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        // Security Notice
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.red.shade200),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                PhosphorIcons.warning(),
                                color: Colors.red.shade600,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'كلمات المرور يجب أن تكون آمنة من 8 حقول',
                                  style: TextStyle(
                                    color: Colors.red.shade700,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Change Password Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton.icon(
                            onPressed:
                                state.remoteDataState == RemoteDataState.loading
                                ? null
                                : _handlePasswordChange,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 2,
                            ),
                            icon:
                                state.remoteDataState == RemoteDataState.loading
                                ? CircularProgressIndicator()
                                : Icon(PhosphorIcons.check(), size: 20),
                            label: Text(
                              'تغيير كلمة المرور',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            iconAlignment: IconAlignment.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool isVisible,
    required VoidCallback onVisibilityToggle,
    required String? Function(String?) validator,
    bool showDots = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: !isVisible,
          validator: validator,
          decoration: InputDecoration(
            hintText: showDots ? '••••••••••' : 'أدخل كلمة المرور',
            hintStyle: TextStyle(color: Colors.grey.shade500),
            prefixIcon: Icon(PhosphorIcons.lock(), color: Colors.grey.shade600),
            suffixIcon: IconButton(
              onPressed: onVisibilityToggle,
              icon: Icon(
                isVisible ? PhosphorIcons.eyeSlash() : PhosphorIcons.eye(),
                color: Colors.grey.shade600,
              ),
            ),
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red.shade400, width: 2),
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordStrengthIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'قوة كلمة المرور:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              _passwordStrengthText,
              style: TextStyle(
                fontSize: 14,
                color: _passwordStrengthColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value:
              [
                _hasMinLength,
                _hasUppercase,
                _hasLowercase,
                _hasNumbers,
                _hasSpecialCharacters,
              ].where((element) => element).length /
              5,
          backgroundColor: Colors.grey.shade200,
          valueColor: AlwaysStoppedAnimation<Color>(_passwordStrengthColor),
        ),
      ],
    );
  }

  Widget _buildPasswordRequirements() {
    return Column(
      children: [_buildRequirementItem('الحد الأدنى 8 أحرف', _hasMinLength)],
    );
  }

  Widget _buildRequirementItem(String text, bool isValid) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(
            isValid
                ? PhosphorIcons.checkCircle(PhosphorIconsStyle.fill)
                : PhosphorIcons.circle(),
            size: 16,
            color: isValid ? Colors.green : Colors.grey.shade400,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: isValid ? Colors.green : Colors.grey.shade600,
              fontWeight: isValid ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  void _handlePasswordChange() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<ForgetPasswordCubit>().resetPassword(
      newPassword: _newPasswordController.text,
    );

    // Show success dialog
  }

  void _showSuccessDialog() {
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
                'تم تغيير كلمة المرور بنجاح!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    LocalDatabase.clearAll();
                    Navigator.of(context).pop(); // Close dialog
                    Navigator.of(context).pop(); // Go back to previous screen
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
