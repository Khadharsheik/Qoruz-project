import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:qoruz_app/data/clients/remote/clients/dio_clients.dart';

class MarketListService {
  final _baseUrl = DioClient.baseUrl;
  Future<dynamic> getMarketListData(int pageNumber) async {
    try {
      final response = await _baseUrl.get(
        'interview.mplist',
        queryParameters: {
          'page': pageNumber,
        },
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    } on Exception catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> getMarketProfileDetailData(String hashId) async {
    try {
      final response = await _baseUrl.get(
        'interview.mplist',
        queryParameters: {
          'id_hash': hashId,
        },
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
