import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/otp_login/otp_bloc.dart';

class OtpButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isEnabled;
  final String? title;

  const OtpButton({
    Key? key,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<OtpCubit, OtpState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 58,
          child: ElevatedButton(
            key: const Key('otp_button'),
            onPressed: state.state == RemoteDataState.loading
                ? null
                : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state.state == RemoteDataState.loading
                    ? CircularProgressIndicator()
                    : Icon(PhosphorIcons.signIn(), size: 20),
                const SizedBox(width: 8),
                Text(
                  state.idetifyer != null
                      ? title ?? 'تأكيد تسجيل الدخول'
                      : title ?? 'تسجيل الدخول',
                  style: textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
