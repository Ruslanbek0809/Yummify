import 'package:dio/dio.dart';
import '../app/app.logger.dart';
import '../shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ApiRootService is used to initialize dio http client in ApiService
class ApiRootService {
  final log = getLogger('ApiRootService');

  /// A powerful Http client for Dart,
  /// which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.
  Dio dio = Dio();

  /// INITIALIZES dio http client when the application is started
  Future<void> initializeDio() async {
    log.v('====== DIO STARTED initialising ======');

    /// GETS saved locale.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString(Constants.savedLocale) ?? 'en_US';
    log.v('ApiRootService _savedLocale: $savedLocale');

    /// Method 1. Adds headers to each REST API that is requested
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Accept-Language': savedLocale == 'en_US' ? 'en' : 'ru',
    };

    /// Method 2. Adds headers to each REST API that is requested
    dio.options.baseUrl = Constants.baseUrl;
    dio.options.headers = headers;

    /// Adds dio interceptors headers to each REST API that is requested.
    /// For each dio instance, We can add one or more interceptors,
    /// by which we can intercept requests 、responses and errors before they are handled by `then` or `catchError`.
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      log.v(
          'REQUEST[${options.method}] => PATH: ${Constants.baseUrl}${options.path}');
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onError: (DioError e, handler) {
      // Do something with response error
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
    }));

    log.v('====== DIO ENDED initialising ======');
  }
}
