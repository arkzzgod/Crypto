
import 'package:dio/dio.dart';

import 'abstract_coins_repository.dart';
import 'models/crypto_coin.dart';
import 'models/crypto_coin_details.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {

  CryptoCoinsRepository({
    required this.dio
  });

  final Dio dio;

  @override
  Future <List<CryptoCoin>> getCoinsList() async {
      final response = await dio.get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,HMSTR&tsyms=USD');
      final data = response.data as Map <String,dynamic>;
      final dataRAW = data['RAW'] as Map <String, dynamic>;
      final cryptoCoinsList = dataRAW.entries.map((e)
      {
        final usdData = (e.value as Map <String,dynamic>)['USD'] as Map <String, dynamic>;
        final details = CryptoCoinDetail.fromJson(usdData);
        //
        // final price = usdData['PRICE'];
        // final imageURL = usdData['IMAGEURL'];
        return CryptoCoin(
          name: e.key,
          details: details,
          // priceInUSD : price,
          // imageURL: 'https://www.cryptocompare.com$imageURL',
        );
      }).toList();
      return cryptoCoinsList;
    }
  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) async {
    final response = await dio.get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');
    final data = response.data as Map <String,dynamic>;
    final dataRAW = data['RAW'] as Map <String, dynamic>;
    final coinData = dataRAW[currencyCode] as Map <String, dynamic>;
    final usdData = coinData['USD'] as Map <String, dynamic>;
    final details = CryptoCoinDetail.fromJson(usdData);
    // final price = usdData['PRICE'];
    // final imageURL = usdData['IMAGEURL'];
    // final toSymbol = usdData['TOSYMBOL'];
    // final lastUpdate = usdData['LASTUPDATE'];
    // final high24Hour = usdData['HIGH24HOUR'];
    // final low24Hour = usdData['LOW24HOUR'];
    return CryptoCoin(
      name: currencyCode,
      details: details,
      // priceInUSD: price,
      // imageURL: 'https://www.cryptocompare.com$imageURL',
      // toSymbol: toSymbol,
      // lastUpdate: DateTime.fromMicrosecondsSinceEpoch(lastUpdate),
      // high24Hour: high24Hour,
      // low24Hour: low24Hour,
    );
  }
  }