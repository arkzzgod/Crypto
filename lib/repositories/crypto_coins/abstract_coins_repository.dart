import 'package:crypto_value/repositories/crypto_coins/models/crypto_coin.dart';


abstract class AbstractCoinsRepository{
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoin> getCoinDetails(String currencyCode);
  }