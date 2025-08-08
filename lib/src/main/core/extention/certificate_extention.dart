import 'package:techara_merchant/api/models/certificate/certificate_data_item.dart';
import 'package:techara_merchant/api/models/home/certificate_data.dart';

extension CertifecateDataItemMapper on CertifecateDataItem {
  Certificate toCertificate() {
    return Certificate(
      id: id,
      sourceName: '', // No equivalent field in CertifecateDataItem
      productDscrp: productDscrp,
      targetName: targetName,
      sourceCountry: sourceCountry,
      generationDscrp: generationDscrp,
      notes: notes ?? '',
      detailsDscrp: detailsDscrp,
      detailsTypeDscrp: detailsTypeDscrp,
      wigth: wigth,
      certificateNo: certificateNo,
      certificateDate: certificateDate,
      createdBy: null, // No equivalent field
      createdDate: '', // No equivalent field
      sourceAdress: '', // No equivalent field
      targetAddress: targetAddress,
      placement: '', // No equivalent field
      referenceNo: null, // No equivalent field
      referenceDate: null, // No equivalent field
      aZbaraNum: '', // No equivalent field
      managerName: '', // No equivalent field
      lang: lang,
      regNo: regNo,
      regDate: regDate,
      targetCountry: targetCountry,
      tranzetCountry: tranzetCountry,
      wigthNum: wigthNum,
      wigthDscrp: null, // No equivalent field
      goverId: goverId,
      operationId: operationId,
      orderNo: orderNo,
      itemsClassID: 0, // No equivalent field
      countryID: 0, // No equivalent field
      regExpireDate: expDate,
      wigthDetails: wigthDetails,
      billDocs: billDocs,
    );
  }
}
