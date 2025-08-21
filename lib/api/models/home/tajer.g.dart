// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tajer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TajerModel _$TajerModelFromJson(Map<String, dynamic> json) => TajerModel(
  id: (json['Id'] as num).toInt(),
  email: json['Email'],
  aName: json['AName'] as String?,
  eName: json['EName'] as String?,
  azbaraNumber: json['AzbaraNumber'] as String,
  phoneNumber: json['PhoneNumber'],
  merchentID: json['MerchentID'] as String,
  arTitle: json['ArTitle'] as String?,
  title: json['Title'] as String?,
  activityA: json['ActivityA'] as String,
  activityE: json['ActivityE'] as String,
  categoryidA: json['CategoryidA'] as String,
  categoryidE: json['CategoryidE'] as String,
  classTypeNo: json['ClassTypeNo'] as String,
  tradeNo: json['TradeNo'] as String,
  regstrationdate: json['Regstrationdate'] as String,
  imgurl: json['imgurl'],
  createdDate: json['CreatedDate'] as String,
  deleted: (json['Deleted'] as num).toInt(),
);

Map<String, dynamic> _$TajerModelToJson(TajerModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Email': instance.email,
      'AName': instance.aName,
      'EName': instance.eName,
      'AzbaraNumber': instance.azbaraNumber,
      'PhoneNumber': instance.phoneNumber,
      'MerchentID': instance.merchentID,
      'ArTitle': instance.arTitle,
      'Title': instance.title,
      'ActivityA': instance.activityA,
      'ActivityE': instance.activityE,
      'CategoryidA': instance.categoryidA,
      'CategoryidE': instance.categoryidE,
      'ClassTypeNo': instance.classTypeNo,
      'TradeNo': instance.tradeNo,
      'Regstrationdate': instance.regstrationdate,
      'imgurl': instance.imgurl,
      'CreatedDate': instance.createdDate,
      'Deleted': instance.deleted,
    };
