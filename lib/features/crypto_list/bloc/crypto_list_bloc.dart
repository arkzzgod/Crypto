
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../../repositories/crypto_coins/abstract_coins_repository.dart';
import '../../../repositories/crypto_coins/models/crypto_coin.dart';
part 'crypto_list_event.dart';
part 'crypto_list_state.dart';


class CryptoListBloc extends Bloc <CryptoListEvent, CryptoListState>
{
  final AbstractCoinsRepository coinsRepository;
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()){
    on<LoadCryptoList>((event, emit) async {
      try {
        if (state is! CryptoListLoaded){
          emit(CryptoListLoading());
        }
        final coinsList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: coinsList));
      }
      catch (e, st){
        emit(CryptoListLoadingFailure(e));
        GetIt.I<Talker>().handle(e, st);
      }
      finally {
        event.completer?.complete();
      }
    }
    );
  }
}

