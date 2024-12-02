
part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable{

}

class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];

}

class CryptoListLoading extends CryptoListState{
  @override
  List<Object?> get props => [];

}

class CryptoListLoaded extends CryptoListState{
  CryptoListLoaded({
    required this.coinsList,
  });
  final List<CryptoCoin> coinsList;

  @override
  List<Object?> get props => [coinsList];
}

class CryptoListLoadingFailure extends CryptoListState
{
  CryptoListLoadingFailure(this.error,);
  Object error;

  @override
  List<Object?> get props => [error];
}
