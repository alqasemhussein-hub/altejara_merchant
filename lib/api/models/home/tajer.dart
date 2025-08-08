import 'package:json_annotation/json_annotation.dart';

part 'tajer.g.dart';

@JsonSerializable()
class TajerModel {
  const TajerModel({
    required this.id,
    this.email,
    required this.aName,
    required this.eName,
    required this.azbaraNumber,
    this.phoneNumber,
    required this.merchentID,
    required this.arTitle,
    required this.title,
    required this.activityA,
    required this.activityE,
    required this.categoryidA,
    required this.categoryidE,
    required this.classTypeNo,
    required this.tradeNo,
    required this.regstrationdate,
    this.imgurl,
    required this.createdDate,
    required this.deleted,
  });

  factory TajerModel.fromJson(Map<String, Object?> json) =>
      _$TajerModelFromJson(json);

  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'Email')
  final dynamic email;
  @JsonKey(name: 'AName')
  final String aName;
  @JsonKey(name: 'EName')
  final String eName;
  @JsonKey(name: 'AzbaraNumber')
  final String azbaraNumber;
  @JsonKey(name: 'PhoneNumber')
  final dynamic phoneNumber;
  @JsonKey(name: 'MerchentID')
  final String merchentID;
  @JsonKey(name: 'ArTitle')
  final String arTitle;
  @JsonKey(name: 'Title')
  final String title;
  @JsonKey(name: 'ActivityA')
  final String activityA;
  @JsonKey(name: 'ActivityE')
  final String activityE;
  @JsonKey(name: 'CategoryidA')
  final String categoryidA;
  @JsonKey(name: 'CategoryidE')
  final String categoryidE;
  @JsonKey(name: 'ClassTypeNo')
  final String classTypeNo;
  @JsonKey(name: 'TradeNo')
  final String tradeNo;
  @JsonKey(name: 'Regstrationdate')
  final String regstrationdate;
  @JsonKey(name: 'imgurl')
  final dynamic imgurl;
  @JsonKey(name: 'CreatedDate')
  final String createdDate;
  @JsonKey(name: 'Deleted')
  final int deleted;

  Map<String, Object?> toJson() => _$TajerModelToJson(this);
}
