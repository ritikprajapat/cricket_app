import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkService {
  final authDio = Dio();
  Dio prepareRequest() {
    BaseOptions dioOptions = BaseOptions(
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );
    authDio.options = dioOptions;
    authDio.interceptors.clear();
    authDio.interceptors.add(
      PrettyDioLogger(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
    );
    return authDio;
  }
}
