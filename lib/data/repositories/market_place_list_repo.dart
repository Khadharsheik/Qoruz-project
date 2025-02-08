import 'dart:developer';

import 'package:qoruz_app/data/clients/remote/services/market_place_list_service.dart';
import 'package:qoruz_app/data/model/responses/market_place_list_response.dart';

class MarketListRepo {
  final _addressService = MarketListService();

  Future<dynamic> getMarketList(int pageNumber) async {
    final getMarketListResponse =
        await _addressService.getMarketListData(pageNumber);

    log('check 2 $pageNumber');
    if (getMarketListResponse['ok'] == true) {
      log('log rkepo ${getMarketListResponse['marketplace_requests']}');
      final dataMap = getMarketListResponse['marketplace_requests'];
      return dataMap
          .map<MarketListResponse>(
              (jsonList) => MarketListResponse.fromJson(jsonList))
          .toList();
    } else {
      final errorMessage = getMarketListResponse['message'];
      throw Exception(errorMessage);
    }
  }

  Future<dynamic> getMarketProfileDetail(String hashId) async {
    final getMarketListResponse =
        await _addressService.getMarketProfileDetailData(hashId);
    log('my hash  $hashId');

    if (getMarketListResponse['ok'] == true) {
      log('log repo ${getMarketListResponse['web_marketplace_requests']}');
      final dataMap = getMarketListResponse['web_marketplace_requests'];
      return MarketListResponse.fromJson(dataMap);
    } else {
      final errorMessage = getMarketListResponse['message'];
      throw Exception(errorMessage);
    }
  }
}
