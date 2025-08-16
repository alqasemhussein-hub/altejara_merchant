// Certificates Page
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/certificate_history/certificate_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/certificate_list_loading.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/form/create_certificate_page.dart';
import 'package:techara_merchant/src/main/core/widget/certificate_card.dart';

class CertificateListView extends StatefulWidget {
  @override
  State<CertificateListView> createState() => _CertificateListViewState();
}

class _CertificateListViewState extends State<CertificateListView> {
  final _scrollController = ScrollController();

  bool _isLoading = false;
  late CertificateCubit _certificateCubit;

  @override
  void initState() {
    super.initState();
    _certificateCubit = context.read<CertificateCubit>();

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.8 &&
        !_isLoading) {
      if (_certificateCubit.state.state == RemoteDataState.loading) {
        return;
      }
      _isLoading = true;
      _certificateCubit.getMoreCertificates();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الشهادات'),

        centerTitle: false,

        actions: [
          ElevatedButton.icon(
            onPressed: () => navigatorKey.currentState?.push(
              MaterialPageRoute(
                builder: (context) => CreateCertificateFormPage(),
              ),
            ),
            icon: Icon(PhosphorIcons.plus()),
            label: const Text('شهادة جديدة'),
          ),
        ],
      ),
      body: BlocListener<CertificateCubit, CertificateState>(
        listener: (context, state) {
          if (state.state == RemoteDataState.loaded ||
              state.state == RemoteDataState.error) {
            _isLoading = false;
          }
        },
        child: BlocBuilder<CertificateCubit, CertificateState>(
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

                    child: Stack(
                      children: [
                        ListView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.all(16),
                          itemCount: state.certificates?.data.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                CertificateCard(
                                  transaction: state.certificates!.data[index],
                                ),
                                if (index ==
                                        state.certificates!.data.length - 1 &&
                                    state.state == RemoteDataState.subloading)
                                  Center(child: CircularProgressIndicator()),
                              ],
                            );
                          },
                        ),
                        // if (state.state == RemoteDataState.subloading)
                        //   Positioned(
                        //     child: Container(
                        //       color: Colors.black38,
                        //       child: Center(child: CircularProgressIndicator()),
                        //     ),
                        //   ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
