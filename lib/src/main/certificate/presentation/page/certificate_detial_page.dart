import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/api/models/certificate/certificate_data_item.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/certificate_price/certificate_price_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/certificate_detials_view.dart';

class CertificateDetailsPage extends StatelessWidget {
  final CertifecateDataItem certificate;
  final String? targetCountry;
  const CertificateDetailsPage({
    Key? key,
    required this.certificate,
    this.targetCountry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CertificatePriceCubit()..getCertificatePrice(),
      child: Scaffold(
        appBar: AppBar(title: Text('تفاصيل شهادة المنشأ')),
        body: CertificateDetailsView(certificate: certificate),
      ),
    );
  }
}
