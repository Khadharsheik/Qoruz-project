import 'package:equatable/equatable.dart';
import 'package:qoruz_app/data/model/responses/market_place_list_response.dart';

class MarketState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MarketStateInitialState extends MarketState {}

class MarketStateProcessingState extends MarketState {}

class MarketListResponseState extends MarketState {
  final List<MarketListResponse>? response;
  final String? errorMsg;

  MarketListResponseState({
    this.response,
    this.errorMsg,
  });

  @override
  List<Object?> get props => [response, errorMsg];
}

class MarketProfileDetailResponseState extends MarketState {
  final MarketListResponse? response;
  final String? errorMsg;

  MarketProfileDetailResponseState({
    this.response,
    this.errorMsg,
  });

  @override
  List<Object?> get props => [response, errorMsg];
}
