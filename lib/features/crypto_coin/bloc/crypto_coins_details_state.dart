
part of 'crypto_coins_details_bloc.dart';

abstract class CryptoCoinDetailsState extends Equatable{

}

class CryptoCoinDetailsInitial extends CryptoCoinDetailsState {
  @override
  List<Object?> get props => [];

}

class CryptoCoinDetailsLoading extends CryptoCoinDetailsState{
  @override
  List<Object?> get props => [];

}

class CryptoCoinDetailsLoaded extends CryptoCoinDetailsState{
  CryptoCoinDetailsLoaded(CryptoCoin coinDetails, {
    required this.coin,
  });
  final List<Object> coin;

  @override
  List<Object?> get props => [coin];
}

class CryptoCoinDetailsLoadingFailure extends CryptoCoinDetailsState
{
  CryptoCoinDetailsLoadingFailure(this.error,);
  Object error;

  @override
  List<Object?> get props => [error];
}