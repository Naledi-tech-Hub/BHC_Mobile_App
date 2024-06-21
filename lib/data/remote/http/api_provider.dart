// import 'dart:async';
// import 'dart:typed_data' show Uint8List;
//
// import 'package:dio/dio.dart'
//     show CancelToken, Dio, Headers, Options, RequestOptions, ResponseType;
// import 'package:injectable/injectable.dart';
// import 'package:praams_mobile/data/local/secure_storage.dart';
// import 'package:praams_mobile/domain/models/user_model.dart';
// import 'package:praams_mobile/util/enums.dart';
// import 'package:praams_mobile/util/helpers.dart' show RemoveNull;
//
// import 'core/http_client.dart';
// import 'core/i_http_client.dart';
//
// @singleton
// class ApiProvider {
//   ApiProvider() {
//     setToken();
//   }
//
//   final BaseHttpClient _httpClient = MHttpClient();
// }
//
// extension Authorization on ApiProvider {
//   Stream<bool> get unAuthStream => (_httpClient as MHttpClient).errorStream;
//
//   void closeStream() => (_httpClient as MHttpClient).closeStream();
//
//   Future<void> setToken([bool isBearer = false]) async =>
//       _httpClient.setToken(isBearer);
//
//   Future<void> _getPreAuthToken() async {
//     const preTokenUrl = String.fromEnvironment('PRE_TOKEN_URL');
//     const preLogin = String.fromEnvironment('PRE_LOGIN');
//     const prePwd = String.fromEnvironment('PRE_PWD');
//     const preClientId = String.fromEnvironment('PRE_CLIENT_ID');
//     const preGrantType = String.fromEnvironment('PRE_GRANT_TYPE');
//     const preSecret = String.fromEnvironment('PRE_CLIENT_SECRET');
//
//     final response = await Dio().post(
//       preTokenUrl,
//       options: Options(
//         headers: {
//           Headers.contentTypeHeader: Headers.formUrlEncodedContentType,
//         },
//       ),
//       data: {
//         "username": preLogin,
//         "password": prePwd,
//         "client_id": preClientId,
//         "grant_type": preGrantType,
//         "client_secret": preSecret
//       },
//     );
//     await SecureStorage.write(
//       key: StorageKeys.accessToken,
//       value: response.data['access_token'],
//     );
//     await setToken(true);
//   }
//
//   Future<Map<String, dynamic>> authWithEmail({
//     required UserAuthData data,
//     bool isCreateAccount = true,
//   }) async {
//     await _getPreAuthToken();
//     final endPoint = isCreateAccount ? 'create_in-house' : 'recover';
//     final value = await _httpClient
//         .post(
//           query: 'User/$endPoint',
//           data: data.toJson(),
//         )
//         .whenComplete(() async => await SecureStorage.clearStorage());
//     return value;
//   }
//
//   Future<Map<String, dynamic>> verifyOtpInMail({
//     required String email,
//     required String specialToken,
//     required String deviceId,
//   }) async =>
//       await _httpClient.get(
//         query: 'User/validate',
//         queryParameters: {
//           'email': email,
//           'specialToken': specialToken,
//           "deviceId": deviceId,
//         },
//       );
//
//   Future<Map<String, dynamic>> externalUserAuth({
//     required UserAuthData data,
//     required String authType,
//   }) async {
//     await _getPreAuthToken();
//     final value = await _httpClient
//         .post(
//           query: 'User/$authType',
//           data: data.toJson(),
//         )
//         .whenComplete(() async => await SecureStorage.clearStorage());
//     return value;
//   }
//
//   Future<Map<String, dynamic>> getUserInfo() async =>
//       await _httpClient.get(query: 'Auth/user');
//
//   Future<void> deleteUser() async =>
//       await _httpClient.get(query: 'User/Delete');
// }
//
// extension Assets on ApiProvider {
//   Future<List> searchAssets({
//     required String searchString,
//     required String deviceId,
//     bool onlyActing = false,
//     CancelToken? cancelToken,
//   }) async =>
//       await _httpClient.get(
//         query: 'AssetSearch/search?searchString=$searchString',
//         queryParameters: {'onlyActing': onlyActing, 'deviceId': deviceId},
//         cancelToken: cancelToken,
//       );
//
//   Future<dynamic> getAssetDetails(int assetId, String deviceId) async =>
//       await _httpClient.get(
//         query: 'Main/GetAsset?assetId=$assetId',
//         queryParameters: {'deviceId': deviceId},
//       );
//
//   Future<dynamic> getBondDetails(int bondId, String deviceId) async =>
//       await _httpClient.get(
//         query: 'Main/GetBond?bondId=$bondId',
//         queryParameters: {'deviceId': deviceId},
//       );
//
//   Future<dynamic> getCompareAssetPeer(int assetId, String deviceId) async =>
//       await _httpClient.get(
//         query: 'Peers/GetPeer?assetId=$assetId',
//         queryParameters: {'deviceId': deviceId},
//       );
//
//   Future<dynamic> getCompareBondPeer(int bondId, String deviceId) async =>
//       await _httpClient.get(
//         query: 'Peers/GetBondPeer?bondId=$bondId',
//         queryParameters: {'deviceId': deviceId},
//       );
//
//   Future<Map<String, dynamic>> getCompareAssetPeerGroup({
//     int? regionId,
//     int? sectorId,
//     int? countryId,
//     int? industryId,
//   }) async =>
//       await _httpClient.get(
//         query: 'Peers/ComparePeerGroups',
//         queryParameters: {
//           "regionId": regionId,
//           "sectorId": sectorId,
//           "countryId": countryId,
//           "industryId": industryId,
//         }..removeNull(),
//       );
//
//   Future<Map<String, dynamic>> getCompareBondPeerGroup({
//     required int bondId,
//     int? regionId,
//     int? sectorId,
//     int? countryId,
//     int? industryId,
//   }) async =>
//       await _httpClient.get(
//         query: 'Peers/CompareBondPeerGroups',
//         queryParameters: {
//           "bondId": bondId,
//           "regionId": regionId,
//           "sectorId": sectorId,
//           "countryId": countryId,
//           "industryId": industryId,
//         }..removeNull(),
//       );
//
//   Future<dynamic> getFreePeersToCompare() async =>
//       await _httpClient.get(query: 'Peers/GetFreePeer');
//
//   Future<Uint8List> downloadReport({
//     required final String email,
//     required final String deviceId,
//     required final ReportType reportType,
//     required final int assetId,
//     required final AssetType assetType,
//   }) async {
//     const url = String.fromEnvironment("REPORT_URL");
//
//     final response = await _httpClient.fetch(
//       RequestOptions(
//         path: "$url${reportType.urlName}",
//         queryParameters: {
//           if (assetType == AssetType.stock) "assetId": assetId,
//           if (assetType == AssetType.bond) "bondId": assetId,
//           "deviceId": deviceId,
//           "userId": email,
//         },
//         method: "POST",
//         responseType: ResponseType.bytes,
//       ),
//     );
//     return response;
//   }
// }
//
// extension PeersDictionaries on ApiProvider {
//   Future<List> getRegions() async =>
//       await _httpClient.get(query: 'PeersDictionaries/GetRegions');
//
//   Future<List> getCountryRegions() async =>
//       await _httpClient.get(query: 'PeersDictionaries/GetCountryRegions');
//
//   Future<List> getCountries() async =>
//       await _httpClient.get(query: 'PeersDictionaries/GetCountries');
//
//   Future<List> getIndustries() async =>
//       await _httpClient.get(query: 'PeersDictionaries/GetIndustries');
//
//   Future<List> getSectorIndustries() async =>
//       await _httpClient.get(query: 'PeersDictionaries/GetSectorIndustries');
//
//   Future<List> getSectors() async =>
//       await _httpClient.get(query: 'PeersDictionaries/GetSectors');
// }
//
// extension ExplorePeers on ApiProvider {
//   Future<Map<String, dynamic>> explorePeers(Map<String, dynamic> query) async =>
//       await _httpClient.get(
//         query: 'Peers/ExplorePeers',
//         queryParameters: query,
//       );
//
//   Future<Map<String, dynamic>> exploreBonds(Map<String, dynamic> query) async =>
//       await _httpClient.get(
//         query: 'Peers/ExploreBondPeers',
//         queryParameters: query,
//       );
// }
//
// extension Payment on ApiProvider {
//   Future<bool> sendPaymentInfo({
//     required Map<String, dynamic> info,
//     required String query,
//   }) async =>
//       await _httpClient.post(
//         query: 'Payments/$query',
//         data: "\"$info\"",
//       );
// }
//
// extension Watchlist on ApiProvider {
//   Future<List> getWatchlistAssets() async =>
//       await _httpClient.get(query: 'Watch/Get');
//
//   Future<void> addToWatchlist(int assetId) async => await _httpClient.get(
//         query: 'Watch/Add',
//         queryParameters: {"assetId": assetId},
//       );
//
//   Future<void> removeFromWatchlist(int assetId) async => await _httpClient.get(
//         query: 'Watch/Remove',
//         queryParameters: {"assetId": assetId},
//       );
// }
