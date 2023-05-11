

import 'package:dsplatform/features/authentication/domain/services/authentication_service.dart';
import 'package:dsplatform/features/authorization/authorization.dart';

/// Authentication repository and his required methods
abstract class AuthenticationRepository {

  /// Checking token exist
  Future<bool> hasToken();

  /// Deleting token
  Future deleteToken();

  Future saveToken(String token);

  Future<String?> getPinCode();

  Future<bool> isUserFillProfile();

  Future<bool> logout();
}

/// Main implementation authentication repository
class IAuthenticationRepository extends AuthenticationRepository {

  final AuthenticationService _authenticationService = AuthenticationService();
  final AuthorizationService _authorizationService = AuthorizationService();

  /// Implementation checking token's exiting
  @override
  Future<bool> hasToken() => _authenticationService.hasToken();

  /// Implementation deleting token
  @override
  Future deleteToken() => _authenticationService.deleteToken();

  /// Implementation save token
  @override
  Future saveToken(String token) => _authenticationService.saveToken(token);

  /// Get pin code string
  @override
  Future<String?> getPinCode() => _authenticationService.getPinCode();

  @override
  Future<bool> isUserFillProfile() => _authenticationService.isUserFillProfile();

  @override
  Future<bool> logout() => _authorizationService.logout();

}


