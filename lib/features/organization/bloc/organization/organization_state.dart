part of 'organization_bloc.dart';

abstract class OrganizationState {}

class OrganizationInitialState extends OrganizationState {}

class OrganizationLoadingState extends OrganizationState {}

class OrganizationLoadedState extends OrganizationState {
  final List<OrganizationModel> organizations;
  OrganizationLoadedState({required this.organizations});
}

class OrganizationFailureState extends OrganizationState {}
