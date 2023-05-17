
import 'package:dsplatform/constants/constants.dart';
import 'package:dsplatform/features/authorization/provider/authenticator.dart';
import 'package:dsplatform/features/profile/domain/services/user_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

/// Authentication service
class AuthenticationService {

  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();

  /// Validation string for matching UUID token
  bool _validateTokenUUID(String stringToken) {
    /// RegExp for uuid pattern
    RegExp uuidRegExp = RegExp("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}");
    /// Return result of having match in string token
    return uuidRegExp.hasMatch(stringToken);
  }

  /// Delete token from secure storage
  Future deleteToken() async {
    try {
      await _flutterSecureStorage.delete(key: AppSecureStorageKeys.tokenKey);
    } on PlatformException catch (e, _) {
      rethrow;
    }
  }

  /// Checking token exist
  Future<bool> hasToken() async {
    try {
      // await GetIt.I.get<Authenticator>().createClient();
      if(await const FlutterSecureStorage().read(key: AppSecureStorageKeys.tokenKey) != null) {
        return true;
      }
      return false;
    } catch(e, _) {
      return false;
    }
  }

  /// Save token
  Future saveToken(String token) async {
    try {
      await _flutterSecureStorage.write(key: AppSecureStorageKeys.tokenKey, value: token);
    } on PlatformException catch (e, _) {
      rethrow;
    }
  }

  /// Get pin code
  Future<String?> getPinCode() async {
    try {
      return await const FlutterSecureStorage().read(key: AppSecureStorageKeys.pinCodeKey);
    } on PlatformException catch (e, _) {
      rethrow;
    }
  }

  Future<bool> isUserFillProfile() async {
    return (await UserService().getUser()) != null;
  }

}