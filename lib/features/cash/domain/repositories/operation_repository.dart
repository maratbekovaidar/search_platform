import 'package:dsplatform/features/cash/domain/models/operation/operation_model.dart';
import 'package:dsplatform/features/cash/domain/services/operation_service.dart';

abstract class OperationRepository {
  Future<List<OperationModel>> getOperations();
}

class IOperationRepository implements OperationRepository {

  final OperationService _operationService = OperationService();

  @override
  Future<List<OperationModel>> getOperations() => _operationService.getOperations();

}