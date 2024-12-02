
part of 'crypto_coins_details_bloc.dart';

abstract class CryptoCoinDetailsEvent extends Equatable {}

class LoadCryptoCoinDetails extends CryptoCoinDetailsEvent{

  LoadCryptoCoinDetails({
    required this.currencyCode,
  });
  final String currencyCode;

  @override
  List<Object?> get props => throw UnimplementedError();
}


