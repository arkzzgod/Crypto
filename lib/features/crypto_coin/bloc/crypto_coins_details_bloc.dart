
import 'package:crypto_value/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../repositories/crypto_coins/abstract_coins_repository.dart';

part 'crypto_coins_details_state.dart';
part "crypto_coins_details_event.dart";

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  CryptoCoinDetailsBloc(this.coinsRepository)
      : super(const CryptoCoinDetailsState()) {
    on<LoadCryptoCoinDetails>(_load);
  }

  final AbstractCoinsRepository coinsRepository;

  Future<void> _load(
      LoadCryptoCoinDetails event,
      Emitter<CryptoCoinDetailsState> emit,
      ) async {
    try {
      if (state is! CryptoCoinDetailsLoaded) {
        emit(const CryptoCoinDetailsLoading());
      }

      final coinDetails =
      await coinsRepository.getCoinDetails(event.currencyCode);

      emit(CryptoCoinDetailsLoaded(coinDetails));
    } catch (e, st) {
      emit(CryptoCoinDetailsLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}