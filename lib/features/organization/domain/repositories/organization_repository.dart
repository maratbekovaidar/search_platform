import 'package:dsplatform/features/organization/domain/models/organization/organization_model.dart';
import 'package:dsplatform/features/organization/domain/services/organization_service.dart';

abstract class OrganizationRepository {

  Future<List<OrganizationModel>> getOrganizations();

}

class IOrganizationRepository implements OrganizationRepository {

  final OrganizationService _organizationService = OrganizationService();

  @override
  Future<List<OrganizationModel>> getOrganizations() => _organizationService.getOrganizations();

}