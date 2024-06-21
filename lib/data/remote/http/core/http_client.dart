// import 'dart:async';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:praams_mobile/data/local/secure_storage.dart';
// import 'package:praams_mobile/di/injector.dart';
// import 'package:praams_mobile/domain/models/request_error_model.dart';
// import 'package:praams_mobile/domain/repositories/user_repository.dart';
// import 'package:praams_mobile/util/enums.dart' show HttpErrorCodes;
// import 'package:praams_mobile/util/log_service.dart';
// import 'i_http_client.dart';
//
// const _baseUrl = String.fromEnvironment('BASE_URL');
//
// @Injectable(as: BaseHttpClient, env: [Environment.dev])
// class MHttpClient extends _HttpClient {
//   MHttpClient()
//       : super(
//           Dio(
//             BaseOptions(
//               baseUrl: _baseUrl,
//               // connectTimeout: duration_30s,
//               // receiveTimeout: duration_30s,
//               headers: {
//                 Headers.contentTypeHeader: Headers.jsonContentType,
//               },
//             ),
//           ),
//         );
// }
//
// class _HttpClient implements BaseHttpClient {
//   final Dio _dio;
//
//   final StreamController<bool> _unAuthorizedUserStream = StreamController();
//
//   Stream<bool> get errorStream => _unAuthorizedUserStream.stream;
//
//   void closeStream() => _unAuthorizedUserStream.close();
//
//   String? _accessToken;
//
//   bool _isRefreshTokenValid = true;
//
//   _HttpClient(this._dio) {
//     _setInterceptors();
//     HttpOverrides.global = MyHttpOverrides();
//   }
//
//   @override
//   Future<void> setToken([bool isBearer = false]) async {
//     _accessToken = await SecureStorage.read(key: StorageKeys.accessToken);
//     if (_accessToken != null) {
//       final authHeaderPrefix = isBearer ? 'Bearer ' : '';
//       _dio.options.headers["Authorization"] =
//           "$authHeaderPrefix${_accessToken!}";
//     }
//   }
//
//   @override
//   Future get({
//     required query,
//     Map<String, dynamic>? queryParameters,
//     CancelToken? cancelToken,
//     ProgressCallback? progressCallback,
//   }) async {
//     return await _sendRequest(_dio.get(
//       query,
//       queryParameters: queryParameters,
//       cancelToken: cancelToken,
//       onReceiveProgress: progressCallback,
//     ));
//   }
//
//   @override
//   Future post({
//     required query,
//     Object? data,
//     CancelToken? cancelToken,
//   }) async =>
//       await _sendRequest(
//         _dio.post(
//           query,
//           data: data,
//           cancelToken: cancelToken,
//         ),
//       );
//
//   @override
//   Future put({
//     required query,
//     Map<String, dynamic>? data,
//     CancelToken? cancelToken,
//   }) async =>
//       await _sendRequest(_dio.put(query, data: data));
//
//   @override
//   Future patch({
//     required query,
//     Map<String, dynamic>? data,
//   }) async =>
//       await _sendRequest(_dio.patch(query, data: data));
//
//   @override
//   Future fetch(RequestOptions requestOptions) async =>
//       await _sendRequest(_dio.fetch(requestOptions));
//
//   @override
//   Future delete({
//     required query,
//     Map<String, dynamic>? data,
//   }) async =>
//       await _sendRequest(_dio.delete(query, data: data));
//
//   Future<void> _refreshToken() async {
//     final accessToken = await SecureStorage.read(key: StorageKeys.accessToken);
//     final refreshToken =
//         await SecureStorage.read(key: StorageKeys.refreshToken);
//     final deviceId = getIt.get<UserRepository>().deviceID;
//
//     _dio.options.headers.remove('Authorization');
//
//     final responseData = await post(
//       query: "Auth/refresh_token",
//       data: {
//         "token": accessToken,
//         "refreshToken": refreshToken,
//         "deviceId": deviceId,
//       },
//     );
//     await SecureStorage.write(
//       key: StorageKeys.accessToken,
//       value: responseData["token"],
//     );
//     await SecureStorage.write(
//       key: StorageKeys.refreshToken,
//       value: responseData["refreshToken"],
//     );
//     await setToken();
//     _isRefreshTokenValid = true;
//   }
//
//   Future _sendRequest(Future<Response> request) async {
//     final Response response = await request.catchError(
//       (error) {
//         if (error is DioException) {
//           throw (error.response?.data == null || error.response?.data.isEmpty)
//               ? RequestErrorModel.dioError(error)
//               : RequestErrorModel.fromJson(
//                   error.response?.data['errors'][0],
//                   error.response?.statusCode,
//                 );
//         }
//         return error;
//       },
//     );
//     final result = response.data is! Map<String, dynamic>
//         ? response.data
//         : response.data?['item'] ?? response.data?['items'];
//     return result ?? false;
//   }
//
//   Future<void> _setInterceptors() async {
//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           println("\n---------- DioRequest ----------"
//               "\n\turl: ${options.baseUrl}${options.path}"
//               "\n\tquery: ${options.queryParameters}"
//               "\n\tmethod: ${options.method}"
//               "\n\tdata: ${options.data}"
//               "\n\theaders: ${options.headers}\n}"
//               "\n--------------------------------\n");
//           return handler.next(options);
//         },
//         onResponse: (response, handler) {
//           final options = response.requestOptions;
//           println("\n---------- DioResponse ----------"
//               "\n\turl: ${options.baseUrl}${options.path}"
//               "\n\tmethod: ${options.method}"
//               "\n\tresponse: $response"
//               "\n--------------------------------\n");
//
//           return handler.next(response);
//         },
//         onError: (error, handler) async {
//           final options = error.requestOptions;
//           println("\n---------- DioError ----------"
//               "\n\turl: ${options.baseUrl}${options.path}"
//               "\n\tmethod: ${options.method}"
//               "\n\tmessage: ${error.message}"
//               "\n\tresponse: ${error.response}"
//               "\n\terrorCode: ${error.response?.statusCode}"
//               "\n--------------------------------\n");
//           if (error.response?.statusCode ==
//                   HttpErrorCodes.NotAllowedInTariff.errorCode &&
//               error.response != null) {
//             return handler.resolve(error.response!);
//           }
//           if (error.type == DioExceptionType.cancel) return;
//           if (options.path == 'Auth/refresh_token' &&
//               error.response?.statusCode ==
//                   HttpErrorCodes.RefreshTokenExpired.errorCode) {
//             _unAuthorizedUserStream.add(true);
//             _isRefreshTokenValid = false;
//             return;
//           }
//           if (error.response?.statusCode ==
//                   HttpErrorCodes.AccessTokenExpired.errorCode &&
//               _isRefreshTokenValid) {
//             await _refreshToken();
//             options.headers['Authorization'] = '$_accessToken';
//             try {
//               handler.resolve(await _dio.fetch(options));
//             } on DioException catch (e) {
//               handler.next(e);
//             }
//             return;
//           }
//           return handler.next(error);
//         },
//       ),
//     );
//   }
// }
//
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
