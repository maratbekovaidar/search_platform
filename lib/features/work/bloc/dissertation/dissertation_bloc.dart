
import 'dart:convert';

import 'package:dsplatform/features/work/domain/models/dissertation/dissertation_model.dart';
import 'package:dsplatform/features/work/domain/repositories/dissertation_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dissertation_event.dart';
part 'dissertation_state.dart';

class DissertationBloc extends Bloc<DissertationEvent, DissertationState> {
  final DissertationRepository dissertationRepository;

  DissertationBloc({required this.dissertationRepository}) : super(DissertationInitialState()) {
    on<DissertationLoadEvent>((event, emit) async {
      try {
        emit(DissertationLoadingState());
        List<DissertationModel> dissertations = await dissertationRepository.getDissertations(event.filter);
        return emit(DissertationLoadedState(dissertations: dissertations));
      } on Exception catch(e, _) {
        return emit(DissertationFailureState());
      }
    });

    on<DissertationSaveEvent>((event, emit) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? savedDissertations = pref.getStringList("bookmark");
      if(savedDissertations != null) {
        savedDissertations.add(jsonEncode(event.dissertationModel.toJson()));
        await pref.setStringList("bookmark", savedDissertations);
      } else {
        await pref.setStringList("bookmark", [jsonEncode(event.dissertationModel.toJson())]);
      }
    });

    on<DissertationLoadFromBookmarksEvent>((event, emit) async {
      emit(DissertationLoadingState());
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? savedDissertations = pref.getStringList("bookmark");
      if(savedDissertations != null) {
        return emit(DissertationLoadedState(dissertations: savedDissertations.map((e) => DissertationModel.fromJson(jsonDecode(e))).toList()));
      } else {
        return emit(DissertationLoadedState(dissertations: []));
      }
    });

  }
}
