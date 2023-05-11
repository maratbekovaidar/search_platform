import 'package:dsplatform/features/profile/domain/models/user/user_model.dart';
import 'package:dsplatform/features/profile/domain/services/user_service.dart';
import 'package:image_picker/image_picker.dart';

abstract class UserRepository {

  Future<UserModel?> getUserInfo();

  Future<bool> updateUser(UserModel userModel);

  Future<bool> isIdentifierFree(String identifier);

  Future<String?> uploadAvatar(XFile avatar);

}

class IUserRepository implements UserRepository {

  final UserService _userService = UserService();

  @override
  Future<UserModel?> getUserInfo() => _userService.getUser();

  @override
  Future<bool> updateUser(UserModel userModel) => _userService.updateUser(userModel);

  @override
  Future<bool> isIdentifierFree(String identifier) => _userService.isIdentifierFree(identifier);

  @override
  Future<String?> uploadAvatar(XFile avatar) => _userService.uploadFile(avatar);
}