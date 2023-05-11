import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Constants of keys for [FlutterSecureStorage]
class AppSecureStorageKeys {

  /// Key of token
  static const String tokenKey = "token";

  /// User's object id key
  static const String objectIdKey = "objectId";

  static const String languageKey = "language";

  /// User's email
  static const String userEmailKey = "user_email";

  /// User's full name
  static const String userFullName = "user_full_name";

  /// Pin code
  static const String pinCodeKey = "pin_code";

  /// Invite chances
  static const String remainingInvitesKey = "remaining_invites";

  /// Local authentication
  static const String localAuthKey = "local_auth";
  static const String faceIdValue = "face_id";
  static const String touchIdValue = "touch_id";


}