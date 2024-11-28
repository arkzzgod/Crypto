

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'models/crypto_coin.dart';

class CryptoCoinsRepository{
    Future <List<CryptoCoin>> getCoinsList() async {
      final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,HMSTR&tsyms=USD');
      debugPrint(response.toString());

      final data = response.data as Map <String,dynamic>;
      final dataRAW = data['RAW'] as Map <String, dynamic>;
      final cryptoCoinsList = dataRAW.entries.map((e) {
        final usdData = (e.value as Map <String,dynamic>)['USD'] as Map <String, dynamic>;
        final price = usdData['PRICE'];
        final imageURL = usdData['IMAGEURL'];
        return CryptoCoin(
          name: e.key,
          priceInUSD : price,
          imageURL: 'https://www.cryptocompare.com$imageURL',
        );
      }).toList();
      return cryptoCoinsList;

    }
  }