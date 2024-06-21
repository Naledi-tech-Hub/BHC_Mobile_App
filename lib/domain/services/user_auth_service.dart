import 'package:bhc_mobile_app/data/local/secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
// import 'package:bhc_mobile_app/data/local/secure_storage.dart';
// import 'package:bhc_mobile_app/data/remote/http/api_provider.dart'
//     show ApiProvider, Authorization;
// import 'package:bhc_mobile_app/domain/models/user_model.dart';
// import 'package:bhc_mobile_app/domain/repositories/user_repository.dart';
import 'package:bhc_mobile_app/util/consts.dart';
import 'package:bhc_mobile_app/util/enums.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';



@singleton
class AuthService {
  //final ApiProvider _apiProvider;
  //final UserRepository _userRepository;
  GoogleSignIn? _googleSignIn;


  //UserModel? get user => _userRepository.user;

  String _specialToken = '';

  //AuthService(this._apiProvider, this._userRepository);

  Future<bool> get noAccessToken async =>
      await SecureStorage.read(key: StorageKeys.accessToken) == null;

  // Future<void> authWithEmail({
  //   required String email,
  //   bool isCreateAccount = true,
  // }) async {
  //   final Map<String, dynamic> result = await _apiProvider.authWithEmail(
  //     data: UserAuthData(
  //       userId: email,
  //       email: email,
  //       name: email,
  //       deviceId: _deviceID,
  //     ),
  //     isCreateAccount: isCreateAccount,
  //   );
  //   _specialToken = result['specialToken'];
  //   AppAnalytics.logSignUp('In House');
  // }
  //
  // Future<void> authWithGoogle(ExternalUserAuthType authType) async {
  //   _googleSignIn ??= GoogleSignIn(
  //     serverClientId: _serverClientId,
  //   );
  //   final signInAccount = await _googleSignIn!.signIn();
  //   if (signInAccount == null) {
  //     await _googleSignIn!.disconnect();
  //     throw Exception('Could not retrieve google account');
  //   }
  //   final result = await _apiProvider
  //       .externalUserAuth(
  //     authType: authType.name,
  //     data: UserAuthData(
  //       userId: signInAccount.id,
  //       email: signInAccount.email,
  //       name: signInAccount.displayName ?? signInAccount.email,
  //       deviceId: _deviceID,
  //       verifyToken: (await signInAccount.authentication).idToken,
  //     ),
  //   )
  //       .catchError((error) {
  //     _googleSignIn!.disconnect();
  //     throw error;
  //   });
  //   await _setToken(result);
  //   await getUserInfo();
  //   authType == ExternalUserAuthType.create_google
  //       ? AppAnalytics.logSignUp('Google')
  //       : AppAnalytics.logLogin('Google');
  // }
  //
  // Future<void> authWithApple(ExternalUserAuthType authType) async {
  //   final credential = await SignInWithApple.getAppleIDCredential(
  //     webAuthenticationOptions: WebAuthenticationOptions(
  //       clientId: 'com.praams.prod',
  //       redirectUri: Uri.parse('https://praa.ms'),
  //     ),
  //     scopes: [
  //       AppleIDAuthorizationScopes.email,
  //       AppleIDAuthorizationScopes.fullName,
  //     ],
  //   );
  //   final result = await _apiProvider.externalUserAuth(
  //     authType: authType.name,
  //     data: UserAuthData(
  //       userId: credential.userIdentifier ?? '',
  //       email: credential.email ?? '',
  //       name: '${credential.familyName}  ${credential.givenName ?? ''})',
  //       deviceId: _deviceID,
  //       verifyToken: credential.authorizationCode,
  //     ),
  //   );
  //   await _setToken(result);
  //   await getUserInfo();
  //   authType == ExternalUserAuthType.create_google
  //       ? AppAnalytics.logSignUp('Apple')
  //       : AppAnalytics.logLogin('Apple');
  // }
  //
  // Future<void> verifyMailOnAuth({required String email}) async {
  //   final result = await _apiProvider.verifyOtpInMail(
  //     email: email,
  //     specialToken: _specialToken,
  //     deviceId: _deviceID,
  //   );
  //   await _setToken(result);
  //   await getUserInfo();
  //   AppAnalytics.logLogin('In House');
  // }
  //
  // Future<void> _setToken(Map<String, dynamic> tokens) async {
  //   await Future.wait([
  //     SecureStorage.write(
  //       key: StorageKeys.accessToken,
  //       value: tokens['token'],
  //     ),
  //     SecureStorage.write(
  //       key: StorageKeys.refreshToken,
  //       value: tokens['refreshToken'],
  //     ),
  //   ]);
  //   await _apiProvider.setToken();
  // }
  //
  // Future<void> deleteUserData() async {
  //   await _apiProvider.deleteUser();
  //   await Future.delayed(duration_500ms);
  //   await SecureStorage.clearStorage();
  // }
  //
  // Future<void> getUserInfo() async {
  //   final data = await _apiProvider.getUserInfo();
  //   final user = UserModel.fromJson(data);
  //   _userRepository.updateUserData = user;
  //   AppAnalytics.setUserId(user.userId);
  //   FirebaseCrashlytics.instance.setUserIdentifier(user.email);
  // }
  //
  // Future<void> signOut() async {
  //   if (_googleSignIn != null && _googleSignIn!.currentUser != null) {
  //     await _googleSignIn!.disconnect();
  //   }
  //   await Future.delayed(duration_500ms);
  //   await SecureStorage.clearStorage();
  // }
}
