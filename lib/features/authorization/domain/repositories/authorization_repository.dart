import 'package:dsplatform/features/authorization/authorization.dart';

abstract class AuthorizationRepository {

  Future<String?> login(String email, String password);

  Future<bool> registration(String email, String password);

  Future<bool> isUserInvited(String email);

}

class IAuthorizationRepository extends AuthorizationRepository {

  final AuthorizationService _authorizationService = AuthorizationService();

  @override
  Future<String?> login(String email, String password) {
    return _authorizationService.login(email, password);
  }

  @override
  Future<bool> registration(String email, String password) {
    return _authorizationService.register(email, password);
  }

  @override
  Future<bool> isUserInvited(String email) {
    return _authorizationService.isUserInvited(email);
  }





}