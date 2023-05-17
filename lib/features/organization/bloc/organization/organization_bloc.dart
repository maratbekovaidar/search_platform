
import 'package:dsplatform/features/organization/domain/models/organization/organization_model.dart';
import 'package:dsplatform/features/organization/domain/repositories/organization_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'organization_event.dart';
part 'organization_state.dart';

class OrganizationBloc extends Bloc<OrganizationEvent, OrganizationState> {
  final OrganizationRepository organizationRepository;
  OrganizationBloc({required this.organizationRepository}) : super(OrganizationInitialState()) {
    on<OrganizationLoadEvent>((event, emit) async {
      try {
        emit(OrganizationLoadingState());
        final List<OrganizationModel> organizations = await organizationRepository.getOrganizations();
        return emit(OrganizationLoadedState(organizations: organizations));
      } on Exception catch(e, _) {
        return emit(OrganizationFailureState());
      }
    });
  }
}
