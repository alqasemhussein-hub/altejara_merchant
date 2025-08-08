import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/src/main/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:techara_merchant/src/main/profile/presentation/pages/profile_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getHomeData(),
      child: ProfilePageView(),
    );
  }
}
