import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/certificate_parameter/certificate_parameter_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/certificate_price/certificate_price_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/create_certificate/create_certificate_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/upload_file/upload_file_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/form/create_certificate_view.dart';

class CreateCertificateFormPage extends StatelessWidget {
  const CreateCertificateFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CertificateParameterCubit()),
        BlocProvider(create: (context) => CreateCertificateCubit()),
        BlocProvider(create: (context) => CertificatePriceCubit()),
        BlocProvider(
          create: (context) => UploadFileCubit(),
        ), // Uncomment if needed
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('طلب شهادة منشأ')),
        body: BlocBuilder<CertificateParameterCubit, CertificateParameterState>(
          builder: (context, state) {
            return CreateCertificateFormView();
          },
        ),
      ),
    );
  }
}
