// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetail _$CryptoCoinDetailFromJson(Map<String, dynamic> json) =>
    CryptoCoinDetail(
      imageURL: json['IMAGEURL'] as String,
      low24Hour: (json['LOW24HOUR'] as num).toDouble(),
      high24Hour: (json['HIGH24HOUR'] as num).toDouble(),
      lastUpdate: CryptoCoinDetail._dateTimeFromJson(
          (json['LASTUPDATE'] as num).toInt()),
      toSymbol: json['TOSYMSOL'] as String,
      priceInUSD: (json['PRICE'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoCoinDetailToJson(CryptoCoinDetail instance) =>
    <String, dynamic>{
      'PRICE': instance.priceInUSD,
      'IMAGEURL': instance.imageURL,
      'TOSYMSOL': instance.toSymbol,
      'LASTUPDATE': CryptoCoinDetail._dateTimeToJson(instance.lastUpdate),
      'HIGH24HOUR': instance.high24Hour,
      'LOW24HOUR': instance.low24Hour,
    };
