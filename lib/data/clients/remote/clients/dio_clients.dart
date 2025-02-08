import 'package:dio/dio.dart';

class DioClient {
  static  Dio baseUrl =
       Dio(BaseOptions(baseUrl: 'https://staging3.hashfame.com/api/v1/'));
}
