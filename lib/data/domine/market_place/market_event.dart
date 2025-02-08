import 'package:equatable/equatable.dart';

class MarketEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMarketListEvent extends MarketEvent {
  final int pageNumber;

  FetchMarketListEvent({
    required this.pageNumber,
  });

  @override
  List<Object?> get props => [pageNumber];
}

class FetchMarketProfileDetailEvent extends MarketEvent {
  final String hashId;

  FetchMarketProfileDetailEvent({
    required this.hashId,
  });

  @override
  List<Object?> get props => [hashId];
}
