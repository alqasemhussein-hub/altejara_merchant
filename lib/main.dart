import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'غرفة تجارة بغداد',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF6750A4),
          onPrimary: Color(0xFFFFFFFF),
          primaryContainer: Color(0xFFEADDFF),
          onPrimaryContainer: Color(0xFF21005D),
          secondary: Color(0xFF625B71),
          onSecondary: Color(0xFFFFFFFF),
          secondaryContainer: Color(0xFFE8DEF8),
          onSecondaryContainer: Color(0xFF1D192B),
          tertiary: Color(0xFF7D5260),
          onTertiary: Color(0xFFFFFFFF),
          tertiaryContainer: Color(0xFFFFD8E4),
          onTertiaryContainer: Color(0xFF31111D),
          error: Color(0xFFBA1A1A),
          onError: Color(0xFFFFFFFF),
          errorContainer: Color(0xFFFFDAD6),
          onErrorContainer: Color(0xFF410002),
          surface: Color(0xFFFEF7FF),
          onSurface: Color(0xFF1D1B20),
          surfaceContainerHighest: Color(0xFFE7E0EC),
          onSurfaceVariant: Color(0xFF49454F),
          outline: Color(0xFF79747E),
          outlineVariant: Color(0xFFCAC4D0),
          shadow: Color(0xFF000000),
          surfaceTint: Color(0xFF6750A4),
          inverseSurface: Color(0xFF322F35),
          onInverseSurface: Color(0xFFF5EFF7),
          inversePrimary: Color(0xFFD0BCFF),
        ),
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

enum LoginMethod { password, otp }

enum OTPMethod { whatsapp, email }

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();

  LoginMethod _loginMethod = LoginMethod.password;
  OTPMethod _otpMethod = OTPMethod.whatsapp;
  bool _obscurePassword = true;
  bool _rememberMe = false;
  bool _isOTPSent = false;
  bool _isLoadingOTP = false;

  late AnimationController _logoController;
  late AnimationController _shimmerController;
  late AnimationController _staggerController;
  late AnimationController _slideController;
  late Animation<double> _logoAnimation;
  late Animation<double> _shimmerAnimation;
  late Animation<Offset> _slideAnimation;
  late List<Animation<double>> _staggerAnimations;

  @override
  void initState() {
    super.initState();

    // Logo floating animation
    _logoController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _logoAnimation = Tween<double>(begin: 0.0, end: -8.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeInOut),
    );

    // Shimmer animation
    _shimmerController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _shimmerAnimation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(parent: _shimmerController, curve: Curves.linear),
    );

    // Slide animation for method switching
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(1.0, 0.0)).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
        );

    // Stagger animation for form elements
    _staggerController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _staggerAnimations = List.generate(8, (index) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _staggerController,
          curve: Interval(
            index * 0.1,
            0.6 + (index * 0.1),
            curve: Curves.easeOutCubic,
          ),
        ),
      );
    });

    _staggerController.forward();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _shimmerController.dispose();
    _staggerController.dispose();
    _slideController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  void _switchLoginMethod(LoginMethod method) {
    if (_loginMethod != method) {
      setState(() {
        _loginMethod = method;
        _isOTPSent = false;
      });
      _slideController.forward().then((_) {
        _slideController.reverse();
      });
      HapticFeedback.mediumImpact();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primary,
                colorScheme.tertiary,
                colorScheme.secondary,
              ],
            ),
          ),
          child: Stack(
            children: [
              _buildBackgroundShapes(),
              SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: _buildLoginCard(theme, colorScheme),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundShapes() {
    return Positioned.fill(
      child: Stack(
        children: [
          Positioned(
            top: 100,
            right: 50,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            left: 30,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 100,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginCard(ThemeData theme, ColorScheme colorScheme) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Card(
                elevation: 8,
                shadowColor: colorScheme.shadow.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildHeader(colorScheme),
                      const SizedBox(height: 32),
                      _buildLoginMethodSelector(colorScheme),
                      const SizedBox(height: 24),
                      _buildForm(theme, colorScheme),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(ColorScheme colorScheme) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _logoAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _logoAnimation.value),
              child: _buildLogo(colorScheme),
            );
          },
        ),
        const SizedBox(height: 32),

        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [colorScheme.primary, colorScheme.tertiary],
          ).createShader(bounds),
          child: Text(
            'مرحباً',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 16),

        Text(
          'غرفة تجارة بغداد',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: colorScheme.onSurface,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 8),

        Text(
          _loginMethod == LoginMethod.password
              ? 'سجل دخولك للوصول إلى حسابك'
              : 'اختر طريقة إرسال رمز التحقق',
          style: TextStyle(
            fontSize: 14,
            color: colorScheme.onSurfaceVariant,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildLogo(ColorScheme colorScheme) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colorScheme.primary, colorScheme.tertiary],
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _shimmerAnimation,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.1),
                      Colors.transparent,
                    ],
                    stops: [
                      _shimmerAnimation.value - 0.3,
                      _shimmerAnimation.value,
                      _shimmerAnimation.value + 0.3,
                    ].map((e) => e.clamp(0.0, 1.0)).toList(),
                  ),
                ),
              );
            },
          ),

          Center(
            child: Icon(
              Icons.business_rounded,
              size: 48,
              color: colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginMethodSelector(ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: _buildMethodTab(
              'كلمة المرور',
              Icons.lock_rounded,
              LoginMethod.password,
              colorScheme,
            ),
          ),
          Expanded(
            child: _buildMethodTab(
              'رمز التحقق',
              Icons.security_rounded,
              LoginMethod.otp,
              colorScheme,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodTab(
    String title,
    IconData icon,
    LoginMethod method,
    ColorScheme colorScheme,
  ) {
    final isSelected = _loginMethod == method;

    return GestureDetector(
      onTap: () => _switchLoginMethod(method),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: colorScheme.primary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected
                  ? colorScheme.onPrimary
                  : colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(ThemeData theme, ColorScheme colorScheme) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.3, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: _loginMethod == LoginMethod.password
          ? _buildPasswordForm(theme, colorScheme)
          : _buildOTPForm(theme, colorScheme),
    );
  }

  Widget _buildPasswordForm(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      key: const ValueKey('password_form'),
      children: [
        _buildAnimatedFormElement(
          0,
          _buildTextField(
            controller: _usernameController,
            label: 'اسم المستخدم أو البريد الإلكتروني',
            prefixIcon: Icons.person_rounded,
          ),
        ),
        const SizedBox(height: 24),

        _buildAnimatedFormElement(1, _buildPasswordField(colorScheme)),
        const SizedBox(height: 24),

        _buildAnimatedFormElement(2, _buildCheckboxRow(colorScheme)),
        const SizedBox(height: 32),

        _buildAnimatedFormElement(3, _buildLoginButton(colorScheme)),
        const SizedBox(height: 32),

        _buildSignUpLink(colorScheme),
      ],
    );
  }

  Widget _buildOTPForm(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      key: const ValueKey('otp_form'),
      children: [
        if (!_isOTPSent) ...[
          _buildAnimatedFormElement(0, _buildOTPMethodSelector(colorScheme)),
          const SizedBox(height: 24),

          _buildAnimatedFormElement(
            1,
            _otpMethod == OTPMethod.whatsapp
                ? _buildPhoneField()
                : _buildEmailField(),
          ),
          const SizedBox(height: 32),

          _buildAnimatedFormElement(2, _buildSendOTPButton(colorScheme)),
        ] else ...[
          _buildAnimatedFormElement(0, _buildOTPSentMessage(colorScheme)),
          const SizedBox(height: 24),

          _buildAnimatedFormElement(1, _buildOTPInputField()),
          const SizedBox(height: 24),

          _buildAnimatedFormElement(2, _buildResendOTPButton(colorScheme)),
          const SizedBox(height: 32),

          _buildAnimatedFormElement(3, _buildVerifyOTPButton(colorScheme)),
        ],
        const SizedBox(height: 32),

        _buildSignUpLink(colorScheme),
      ],
    );
  }

  Widget _buildOTPMethodSelector(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'طريقة الإرسال',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildOTPMethodCard(
                'واتساب',
                Icons.chat_rounded,
                OTPMethod.whatsapp,
                colorScheme,
                Colors.green,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildOTPMethodCard(
                'البريد الإلكتروني',
                Icons.email_rounded,
                OTPMethod.email,
                colorScheme,
                Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOTPMethodCard(
    String title,
    IconData icon,
    OTPMethod method,
    ColorScheme colorScheme,
    Color accentColor,
  ) {
    final isSelected = _otpMethod == method;

    return GestureDetector(
      onTap: () {
        setState(() {
          _otpMethod = method;
        });
        HapticFeedback.lightImpact();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? accentColor.withOpacity(0.1)
              : colorScheme.surfaceContainerHighest,
          border: Border.all(
            color: isSelected ? accentColor : colorScheme.outline,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? accentColor : colorScheme.outline,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? accentColor : colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return _buildTextField(
      controller: _phoneController,
      label: 'رقم الهاتف',
      prefixIcon: Icons.phone_rounded,
      keyboardType: TextInputType.phone,
    );
  }

  Widget _buildEmailField() {
    return _buildTextField(
      controller: _emailController,
      label: 'البريد الإلكتروني',
      prefixIcon: Icons.email_rounded,
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildOTPInputField() {
    return TextField(
      controller: _otpController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 8,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(6),
      ],
      decoration: InputDecoration(
        labelText: 'رمز التحقق',
        hintText: '000000',
        prefixIcon: const Icon(Icons.security_rounded),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
    );
  }

  Widget _buildOTPSentMessage(ColorScheme colorScheme) {
    final contact = _otpMethod == OTPMethod.whatsapp
        ? _phoneController.text
        : _emailController.text;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_rounded,
            color: colorScheme.primary,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'تم إرسال رمز التحقق',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'إلى $contact',
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.onPrimaryContainer.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSendOTPButton(ColorScheme colorScheme) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton.icon(
        onPressed: _isLoadingOTP ? null : _sendOTP,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 2,
        ),
        icon: _isLoadingOTP
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: colorScheme.onPrimary,
                ),
              )
            : Icon(
                _otpMethod == OTPMethod.whatsapp
                    ? Icons.chat_rounded
                    : Icons.email_rounded,
              ),
        label: Text(
          _isLoadingOTP ? 'جارٍ الإرسال...' : 'إرسال رمز التحقق',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildResendOTPButton(ColorScheme colorScheme) {
    return TextButton.icon(
      onPressed: _sendOTP,
      icon: const Icon(Icons.refresh_rounded),
      label: const Text('إعادة الإرسال'),
    );
  }

  Widget _buildVerifyOTPButton(ColorScheme colorScheme) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton.icon(
        onPressed: _verifyOTP,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 2,
        ),
        icon: const Icon(Icons.verified_user_rounded),
        label: const Text(
          'تأكيد رمز التحقق',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildAnimatedFormElement(int index, Widget child) {
    if (index >= _staggerAnimations.length) return child;

    return AnimatedBuilder(
      animation: _staggerAnimations[index],
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - _staggerAnimations[index].value)),
          child: Opacity(
            opacity: _staggerAnimations[index].value,
            child: child,
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData prefixIcon,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
    );
  }

  Widget _buildPasswordField(ColorScheme colorScheme) {
    return TextField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: 'كلمة المرور',
        prefixIcon: const Icon(Icons.lock_rounded),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword
                ? Icons.visibility_rounded
                : Icons.visibility_off_rounded,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
            HapticFeedback.lightImpact();
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
      ),
    );
  }

  Widget _buildCheckboxRow(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value ?? false;
                });
                HapticFeedback.lightImpact();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const Text('تذكرني'),
          ],
        ),
        TextButton(
          onPressed: () {
            HapticFeedback.lightImpact();
          },
          child: const Text('نسيت كلمة المرور؟'),
        ),
      ],
    );
  }

  Widget _buildLoginButton(ColorScheme colorScheme) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton(
        onPressed: () {
          HapticFeedback.mediumImpact();
          _showLoginSuccess(colorScheme);
        },
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 2,
        ),
        child: const Text(
          'تسجيل الدخول',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildSignUpLink(ColorScheme colorScheme) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 14),
        children: [
          const TextSpan(text: 'ليس لديك حساب؟ '),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
              },
              child: Text(
                'إنشاء حساب جديد',
                style: TextStyle(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendOTP() async {
    final contact = _otpMethod == OTPMethod.whatsapp
        ? _phoneController.text
        : _emailController.text;

    if (contact.isEmpty) {
      _showErrorSnackBar(
        _otpMethod == OTPMethod.whatsapp
            ? 'يرجى إدخال رقم الهاتف'
            : 'يرجى إدخال البريد الإلكتروني',
      );
      return;
    }

    setState(() {
      _isLoadingOTP = true;
    });

    HapticFeedback.mediumImpact();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoadingOTP = false;
      _isOTPSent = true;
    });

    _showSuccessSnackBar(
      _otpMethod == OTPMethod.whatsapp
          ? 'تم إرسال رمز التحقق عبر واتساب'
          : 'تم إرسال رمز التحقق إلى بريدك الإلكتروني',
    );
  }

  void _verifyOTP() {
    if (_otpController.text.length != 6) {
      _showErrorSnackBar('يرجى إدخال رمز التحقق المكون من 6 أرقام');
      return;
    }

    HapticFeedback.mediumImpact();
    _showLoginSuccess(Theme.of(context).colorScheme);
  }

  void _showLoginSuccess(ColorScheme colorScheme) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.check_circle_rounded, color: Colors.green, size: 28),
            const SizedBox(width: 12),
            const Text('نجح تسجيل الدخول'),
          ],
        ),
        content: Text(
          _loginMethod == LoginMethod.password
              ? 'تم تسجيل دخولك بنجاح إلى غرفة تجارة بغداد'
              : 'تم التحقق من رمز OTP بنجاح وتسجيل دخولك',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle_outline_rounded,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
