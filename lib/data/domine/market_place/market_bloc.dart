import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoruz_app/data/domine/market_place/market_event.dart';
import 'package:qoruz_app/data/domine/market_place/market_state.dart';
import 'package:qoruz_app/data/repositories/market_place_list_repo.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  final _marketRepo = MarketListRepo();

  MarketBloc() : super(MarketStateInitialState()) {
    on<FetchMarketListEvent>(_fetchMarketList);
    on<FetchMarketProfileDetailEvent>(_fetchMarketProfileDetail);
  }

  _fetchMarketList(
      FetchMarketListEvent event, Emitter<MarketState> emit) async {
    try {
      emit(MarketStateProcessingState());
      final res = await _marketRepo.getMarketList(event.pageNumber);
      if (res != null) {
        emit(
          MarketListResponseState(
            response: res,
          ),
        );
      } else {
        emit(
          MarketListResponseState(
            errorMsg: 'res',
          ),
        );
      }
    } catch (e) {
      emit(
        MarketListResponseState(
          errorMsg: e.toString(),
        ),
      );
    }
  }

  _fetchMarketProfileDetail(
      FetchMarketProfileDetailEvent event, Emitter<MarketState> emit) async {
    try {
      emit(MarketStateProcessingState());
      final res = await _marketRepo.getMarketProfileDetail(event.hashId);
      if (res != null) {
        emit(
          MarketProfileDetailResponseState(
            response: res,
          ),
        );
        await Future.delayed(Duration(milliseconds: 100));
      } else {
        emit(
          MarketProfileDetailResponseState(
            errorMsg: 'res',
          ),
        );
      }
    } catch (e) {
      emit(
        MarketProfileDetailResponseState(
          errorMsg: e.toString(),
        ),
      );
    }
  }
}
