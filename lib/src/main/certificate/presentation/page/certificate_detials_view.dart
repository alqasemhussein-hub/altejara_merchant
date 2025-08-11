import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/api/models/certificate/certificate_data_item.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/snackbar/snackbar.dart';
import 'package:techara_merchant/src/core/widgets/state_loader.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/certificate_price/certificate_price_cubit.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/cubit/payment_cubit.dart';
import 'package:techara_merchant/src/main/core/services/payment_web_view_screen.dart';
import 'package:techara_merchant/src/main/profile/presentation/cubit/profile/profile_cubit.dart';

class CertificateDetailsView extends StatelessWidget {
  final CertifecateDataItem certificate;
  final String? targetCountry;
  const CertificateDetailsView({
    Key? key,
    required this.certificate,
    this.targetCountry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          if (certificate.orderNo.isNotEmpty)
            Container(
              child: Wrap(
                children: [
                  if (certificate.operationId == 1)
                    Container(
                      width: double.infinity,
                      child: PaymentButton(certificate: certificate),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: ElevatedButton(
                      onPressed: () => navigatorKey.currentState?.push(
                        MaterialPageRoute(
                          builder: (context) => PaymentInAppWebViewScreen(
                            url:
                                'https://tajr.gcc.iq/orderinvoice/' +
                                certificate.orderNo,
                            title: 'تفاصيل الطلب',
                          ),
                        ),
                      ),
                      child: Text('عرض الطلب'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: ElevatedButton(
                      onPressed: certificate.operationId != 1
                          ? null
                          : () => navigatorKey.currentState?.push(
                              MaterialPageRoute(
                                builder: (context) => PaymentInAppWebViewScreen(
                                  url:
                                      'https://tajr.gcc.iq/viewcertificate/' +
                                      certificate.orderNo,
                                  title: 'تفاصيل الطلب',
                                ),
                              ),
                            ),
                      child: Text('عرض الشهادة'),
                    ),
                  ),
                ],
              ),
            ),
          // Summary sections
          _getSourceDetaild(certificate.lang),

          const SizedBox(height: 16),

          _buildSummarySection('معلومات الشحنة', [
            _buildSummaryItem('رقم الفاتورة:', certificate.certificateNo),
            _buildSummaryItem(
              'تاريخ الفاتورة:',
              certificate.certificateDate.split('T').first,
            ),
            _buildSummaryItem('رقم الاجازة:', certificate.regNo),
            _buildSummaryItem(
              'تاريخ إنشاء الشهادة:',
              certificate.regDate.split('T').first,
            ),
            _buildSummaryItem(
              'تاريخ انتهاء الاجازة:',
              certificate.expDate.split('T').first,
            ),
          ]),

          const SizedBox(height: 16),

          _buildSummarySection('تفاصيل المادة', [
            _buildSummaryItem('تفاصيل الشحن:', certificate.generationDscrp),
            _buildSummaryItem(
              'المنتج وعنوانة كاملة:',
              certificate.productDscrp,
            ),
            _buildSummaryItem('بلد المنشأ:', 'العراق'),
            _buildSummaryItem('المكان:', 'بغداد'),
            _buildSummaryItem('وصف السلع:', certificate.detailsDscrp),
            // _buildSummaryItem('صنف المادة:', 'ملحقات نفطية خفيفة'),
            _buildSummaryItem('نوع التعبئة:', certificate.detailsTypeDscrp),
            _buildSummaryItem(
              'الوزن القائم:',
              certificate.wigthNum.toString() + ' ' + certificate.wigth,
            ),
            _buildSummaryItem('تفاصيل الوزن:', certificate.wigthDetails),
            _buildSummaryItem('الملاحظات:', certificate.notes ?? ''),
          ]),

          const SizedBox(height: 16),

          _buildSummarySection('تفاصيل المستورد', [
            _buildSummaryItem('اسم المستورد:', certificate.targetName),
            if (targetCountry != null)
              _buildSummaryItem('البلد المستورد:', targetCountry!),
            _buildSummaryItem('عنوان المستورد:', certificate.targetAddress),
          ]),

          const SizedBox(height: 24),

          _priceSection(context),
        ],
      ),
    );
  }

  Widget _priceSection(BuildContext context) {
    final _certificatePriceCubit = context.read<CertificatePriceCubit>();
    if (_certificatePriceCubit.state.remoteStatus != RemoteDataState.loaded &&
        _certificatePriceCubit.state.remoteStatus != RemoteDataState.loading) {
      _certificatePriceCubit.getCertificatePrice();
    }

    return BlocBuilder<CertificatePriceCubit, CertificatePriceState>(
      builder: (context, state) {
        return StateLoader(
          onReload: () => _certificatePriceCubit.getCertificatePrice(),
          state: state.remoteStatus,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green.shade200),
            ),

            child: Column(
              children: [
                Text(
                  'الفاتورة',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'نوع الفاتورة:',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      state.certificatePrices?.dscrp ?? '',
                      style: TextStyle(color: Colors.green.shade700),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Column(
                  children:
                      state.certificatePrices?.prices.map((price) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'المبلغ:',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              price.amount.toString() + ' د.ع',
                              style: TextStyle(
                                color: Colors.green.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      }).toList() ??
                      [],
                ),

                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'المجموع:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${(state.certificatePrices?.prices.fold<double>(0.0, (sum, price) => sum + (price.amount ?? 0.0)) ?? 0.0).toInt().toStringAsFixed(2)} د.ع', // Display with 2 decimal places
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _getSourceDetaild(String lang) {
    final ProfileCubit _profileCubit = navigatorKey.currentContext!
        .read<ProfileCubit>();
    final tradeName = lang == 'A'
        ? _profileCubit.state.userData?.tajer.arTitle ?? ''
        : _profileCubit.state.userData?.tajer.title ?? '';
    final authorizedManager = lang == 'A'
        ? _profileCubit.state.userData?.tajer.aName ?? ''
        : _profileCubit.state.userData?.tajer.eName ?? '';
    final sourceAddress = lang == 'A'
        ? _profileCubit.state.userData?.tajerComplement.jobAddressA ?? ''
        : _profileCubit.state.userData?.tajerComplement.jobAddressE ?? '';
    return _buildSummarySection('تفاصيل المصدر', [
      _buildSummaryItem(
        'رقم الاضبارة:',
        _profileCubit.state.userData?.tajerComplement.azbaraNum ?? '',
      ),
      _buildSummaryItem('الاسم التجاري:', tradeName),
      _buildSummaryItem('المدير المفوض:', authorizedManager),
      _buildSummaryItem('عنوان المصدر:', sourceAddress),
    ]);
  }

  Widget _buildSummarySection(String title, List<Widget> items) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          ...items,
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key, required this.certificate, this.onSuccess});

  final CertifecateDataItem certificate;
  final Function()? onSuccess;
  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentCubit, PaymentState>(
      listenWhen: (previous, current) =>
          previous.remoteStatus != current.remoteStatus,
      listener: (context, state) {
        if (state.remoteStatus == RemoteDataState.error) {
          showErrorSnackBar(
            state.errorMessage ?? 'حدث خطأ أثناء تحميل البيانات',
          );
        }
        if (state.remoteStatus == RemoteDataState.loaded) {
          _goPayment(state.paymentResponse?.formUrl ?? '');
        }
      },
      child: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
              ),
              onPressed: state.remoteStatus == RemoteDataState.loading
                  ? () {}
                  : () async {
                      if (state.remoteStatus != RemoteDataState.loaded) {
                        context.read<PaymentCubit>().getPaymentDetails(
                          orderId: certificate.orderNo,
                          amount: certificate.amount.toDouble(),
                        );
                        return;
                      }
                    },
              icon: state.remoteStatus == RemoteDataState.loading
                  ? CircularProgressIndicator.adaptive()
                  : const Icon(Icons.payment),
              label: Text(' دفع الطلب'),
            ),
          );
        },
      ),
    );
  }

  _goPayment(String url) async {
    final res = await navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) =>
            PaymentInAppWebViewScreen(url: url, title: 'دفع الطلب'),
      ),
    );
    if (res == true) {
      showSuccessSnackBar('تم الدفع بنجاح');
      onSuccess?.call();
    } else {
      showErrorSnackBar('فشل الدفع');
    }
  }
}
