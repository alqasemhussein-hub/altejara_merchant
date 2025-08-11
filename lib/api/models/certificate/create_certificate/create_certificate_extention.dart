import 'package:techara_merchant/api/models/certificate/add_certifecate_response.dart';
import 'package:techara_merchant/api/models/certificate/certificate_data_item.dart';

extension AddCertifecateResponseExtension on AddCertifecateResponse {
  CertifecateDataItem toCertifecateDataItem() {
    return CertifecateDataItem(
      id: this.id,
      productDscrp: this.productDscrp,
      targetName: this.targetName,
      sourceCountry: this.sourceCountry.toString(),
      generationDscrp: this.generationDscrp,
      notes: this.notes,
      detailsDscrp: this.detailsDscrp,
      detailsTypeDscrp: this.detailsTypeDscrp,
      wigth: this.wigth,
      certificateNo: this.certificateNo,
      certificateDate: this.certificateDate,
      targetAddress: this.targetAddress.toString(),
      lang: this.lang,
      regNo: this.regNo,
      regDate: this.regDate,
      targetCountry: this.targetCountry,
      tranzetCountry: this.tranzetCountry,
      goverId: this.goverId,
      wigthNum: this.wigthNum.toDouble(),
      orderNo: this.orderNo,
      amount: this.amount,
      operationId: this.operationId == null ? 0 : this.operationId as int,
      wigthDetails: this.wigthDetails,
      operationName: this.operationName.toString(),
      expDate: this.expDate,
      document: this.document?.toString(),
      certificateId: this.certificateId as int?,
      state: this.state == null ? 0 : this.state as int,
      oN: this.oN,
      srialCertefecate: this.srialCertefecate,
      billDocs: this.billDocs,
    );
  }
}
