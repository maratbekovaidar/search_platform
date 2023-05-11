
import 'package:dsplatform/features/profile/domain/models/invite/invite_model.dart';
import 'package:dsplatform/features/profile/domain/services/invite_service.dart';

abstract class InviteRepository {
  Future<bool> inviteByEmail(String email);

  Future<List<InviteModel>> getInvites();

  Future<bool> revokeInvite(String email);
}

class IInviteRepository extends InviteRepository {

  final InviteService _inviteService = InviteService();

  @override
  Future<bool> inviteByEmail(String email) => _inviteService.inviteByEmail(email);

  @override
  Future<List<InviteModel>> getInvites() => _inviteService.getInvites();

  @override
  Future<bool> revokeInvite(String email) => _inviteService.revokeInvite(email);
}