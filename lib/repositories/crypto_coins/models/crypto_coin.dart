
import 'package:crypto_value/repositories/crypto_coins/models/crypto_coin_details.dart';
import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
    final String name;
    final CryptoCoinDetail details;

  const CryptoCoin({
    required this.name,
    required this.details,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, details];
}

