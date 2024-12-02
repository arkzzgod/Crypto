
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'crypto_coin_details.g.dart';
@JsonSerializable()

class CryptoCoinDetail extends Equatable{

  const CryptoCoinDetail({
    required this.imageURL,
    required this.low24Hour,
    required this.high24Hour,
    required this.lastUpdate,
    required this.toSymbol,
    required this.priceInUSD,
  });

  @JsonKey(name: 'PRICE')
  final double priceInUSD;
  @JsonKey(name: 'IMAGEURL')
  final String imageURL;
  @JsonKey(name: 'TOSYMSOL')
  final String toSymbol;
  @JsonKey(name: 'LASTUPDATE' ,toJson: _dateTimeToJson, fromJson: _dateTimeFromJson)
  final DateTime lastUpdate;
  @JsonKey(name: 'HIGH24HOUR')
  final double high24Hour;
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hour;

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageURL';


  factory CryptoCoinDetail.fromJson(Map<String, dynamic> json) => _$CryptoCoinDetailFromJson(json);

  /// Connect the generated [_$CryptoCoinDetailToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CryptoCoinDetailToJson(this);

  static int _dateTimeToJson(DateTime time) => time.microsecondsSinceEpoch;

  static DateTime _dateTimeFromJson(int miliseconds) => DateTime.fromMillisecondsSinceEpoch(miliseconds);

  @override
  List<Object> get props => [priceInUSD,imageURL,toSymbol,lastUpdate,high24Hour,low24Hour];
}