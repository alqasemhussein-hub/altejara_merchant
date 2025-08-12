import 'package:techara_merchant/api/models/certificate/certificate_data_item.dart';
import 'package:techara_merchant/api/models/home/certificate_data.dart';

extension CertificateMapper on Certificate {
  CertifecateDataItem toDataItem() {
    return CertifecateDataItem(
      id: id,
      productDscrp: productDscrp,
      targetName: targetName,
      sourceCountry: sourceCountry,
      generationDscrp: generationDscrp,
      notes: (notes?.isEmpty ?? true) ? null : notes,
      detailsDscrp: detailsDscrp,
      detailsTypeDscrp: detailsTypeDscrp,
      wigth: wigth,
      certificateNo: certificateNo,
      certificateDate: certificateDate,
      targetAddress: targetAddress,
      lang: lang,
      regNo: regNo,
      regDate: regDate,
      targetCountry: targetCountry is int ? targetCountry as int : 0,
      tranzetCountry: tranzetCountry is int ? tranzetCountry as int : 0,
      goverId: goverId,
      wigthNum: wigthNum,
      orderNo: orderNo,
      amount:
          0, // Certificate doesn't have `amount`, set default or map from elsewhere
      operationId: operationId,
      wigthDetails: wigthDetails ?? '',
      operationName: '', // no field in Certificate, set default or derive
      expDate: regExpireDate, // mapping Certificate.regExpireDate to expDate
      document: null, // no field in Certificate
      certificateId: id, // or null if not same as `id`
      state: 0, // no field in Certificate, set default
      oN: null,
      srialCertefecate: null,
      billDocs: billDocs is String ? billDocs as String : null,
    );
  }
}
