import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/certificate_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/certificate_list_view.dart';

class CertificateListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CertificateCubit()..getCertificates(),
      child: CertificateListView(),
    );
  }
}
