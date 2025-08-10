import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/certificate_history/certificate_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/certificate_price/certificate_price_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/certificate_list_view.dart';

class CertificateListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CertificateCubit()..getCertificates(),
        ),
        BlocProvider(create: (context) => CertificatePriceCubit()),
      ],
      child: CertificateListView(),
    );
  }
}
