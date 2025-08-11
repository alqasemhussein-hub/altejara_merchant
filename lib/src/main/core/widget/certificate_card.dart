import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/api/models/certificate/certificate_data_item.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
import 'package:techara_merchant/src/main/certificate/presentation/page/certificate_detial_page.dart';

class CertificateCard extends StatelessWidget {
  final CertifecateDataItem transaction;

  const CertificateCard({Key? key, required this.transaction})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) =>
              CertificateDetailsPage(certificate: transaction),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Status indicator
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _getTextColor(transaction.operationId).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _getTextColor(transaction.operationId),
                ),
              ),
              child: Text(
                _getText(transaction.operationId),
                style: TextStyle(
                  color: _getTextColor(transaction.operationId),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(width: 16),

            // Transaction details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            PhosphorIcons.fileText(),
                            color: Colors.blue,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'شهادة منشأ',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'نوع المعاملة',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            PhosphorIcons.hash(),
                            color: Colors.grey.shade600,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            transaction.orderNo,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'رقم الطلب',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getText(int operationId) {
    switch (operationId) {
      case 3:
        return 'مقبولة';
      case 1:
        return 'قيد الانتظار';
      case 4:
        return 'مرفوضة';
      case 2:
        return 'معلقة';
      default:
        return 'غير معروف';
    }
  }

  _getTextColor(int operationId) {
    switch (operationId) {
      case 3:
        return Colors.green.shade700;
      case 1:
        return Colors.orange.shade700;
      case 4:
        return Colors.red.shade700;
      case 2:
        return Colors.grey.shade700;
      default:
        return Colors.black87;
    }
  }
}
