import 'package:QuotzApp/models/quote_model.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class QuoteServices {
  Dio _dio;

  QuoteServices() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 100000,
        connectTimeout: 100000,
        baseUrl: "https://x8ki-letl-twmt.n7.xano.io/api:eOZvILXI");
    _dio = Dio(options);
    _dio.interceptors.add(PrettyDioLogger());
  }

  Future<List<QuoteModel>> getQuotes() async {
    final url = "/quote";
    try {
      final response = await _dio.get(url);
      return quoteModelFromJson(response.data);
    } on DioError catch (error) {
      throw error.error;
    }
  }
}
