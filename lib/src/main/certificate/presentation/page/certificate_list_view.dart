// Certificates Page
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/certificate_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/certificate_list_loading.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/form/create_certificate_page.dart';
import 'package:techara_merchant/src/main/core/extention/certificate_extention.dart';
import 'package:techara_merchant/src/main/core/widget/certificate_card.dart';

class CertificateListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الشهادات'),

        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(PhosphorIcons.magnifyingGlass()),
          ),
        ],
      ),
      body: BlocBuilder<CertificateCubit, CertificateState>(
        builder: (context, state) {
          return state.state == RemoteDataState.loading
              ? CertificateListViewLoading()
              : state.state == RemoteDataState.error ||
                    state.state == RemoteDataState.ideal
              ? Center(child: Text('لا توجد شهادات متاحة'))
              : RefreshIndicator(
                  onRefresh: () async {
                    context.read<CertificateCubit>().getCertificates();
                  },

                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.certificates?.data.length,
                    itemBuilder: (context, index) {
                      return CertificateCard(
                        transaction: state.certificates!.data[index]
                            .toCertificate(),
                      );
                    },
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => navigatorKey.currentState?.push(
          MaterialPageRoute(builder: (context) => CreateCertificateForm()),
        ),
        icon: Icon(PhosphorIcons.plus()),
        label: const Text('شهادة جديدة'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
    );
  }
}
