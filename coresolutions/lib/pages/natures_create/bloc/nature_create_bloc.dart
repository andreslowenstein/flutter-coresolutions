import 'package:bloc/bloc.dart';
import 'package:coresolutions/repository/repository.dart';

import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'nature_create_event.dart';
part 'nature_create_state.dart';

class NatureCreateBloc
    extends Bloc<NatureCreateInitialEvent, NatureCreateState> {
  final Repository _repository;

  NatureCreateBloc(this._repository) : super(NatureCreateInitial()) {
    on<NatureCreateEvent>((event, emit) async {
      await _natureCreateEvent(event, emit);
    });
    on<GoBackEvent>(((event, emit) {
      emit(NatureCreateInitial());
    }));
  }

  Future<void> _natureCreateEvent(
      NatureCreateEvent event, Emitter<NatureCreateState> emit) async {
    if (event.alias == "" || event.code == "" || event.description == "") {
      emit(
        const NatureCreateErrorState(
            errorMsg: "Por favor completa todos los campos."),
      );
      return;
    }

    try {
      emit(NatureCreateLoadingState());

      //Busco el token guardado en localstorage
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString("token");

      await _repository.createNature(
        event.code,
        event.alias,
        event.description,
        token!,
      );

      emit(NatureCreateLoadedState());
    } catch (e) {
      emit(NatureCreateErrorState(errorMsg: e.toString()));
    }
  }
}
