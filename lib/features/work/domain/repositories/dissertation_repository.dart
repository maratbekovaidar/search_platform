import 'package:dsplatform/features/work/domain/models/dissertation/dissertation_model.dart';
import 'package:dsplatform/features/work/domain/services/dissertation_service.dart';

abstract class DissertationRepository {
  Future<List<DissertationModel>> getDissertations(String? filter);
}

class IDissertationRepository implements DissertationRepository {

  final DissertationService _dissertationService = DissertationService();

  @override
  Future<List<DissertationModel>> getDissertations(String? filter) => _dissertationService.getDissertations(filter);

}