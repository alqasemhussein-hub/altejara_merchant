import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:techara_merchant/src/core/style/theme/app_theme.dart';

class BottomSearch extends StatelessWidget {
  const BottomSearch({
    super.key,
    required this.textTheme,
    required this.colorScheme,
  });

  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18).copyWith(top: 0),
      width: double.infinity,
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: 25).copyWith(right: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFFFC93E), Color(0xFFB81F1E)],
        ),
        borderRadius: BorderRadius.circular(38),
      ),
      child: InkWell(
        onTap: () {
          print('Start Chat tapped');
        },
        borderRadius: BorderRadius.circular(28),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset("assets/svg/search.svg", width: 32, height: 32),
              const SizedBox(width: 8),
              Text(
                'Search everything...',
                style: textTheme.titleMedium!.copyWith(
                  color: AppTheme.whiteColor,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: const BorderRadius.all(Radius.circular(32)),
                ),
                child: SvgPicture.asset(
                  "assets/svg/stare.svg",
                  width: 20,
                  height: 20,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
