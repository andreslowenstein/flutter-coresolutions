import 'package:bloc/bloc.dart';
import 'package:coresolutions/models/natures.dart';
import 'package:coresolutions/repository/repository.dart';
import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'natures_event.dart';
part 'natures_state.dart';

class NaturesBloc extends Bloc<NaturesEvent, NaturesState> {
  final Repository _repository;

  NaturesBloc(this._repository) : super(const NaturesState()) {
    on<GetNaturesEvent>((event, emit) async {
      await _getNaturesEvent(event, emit);
    });
  }

  Future<void> _getNaturesEvent(
      GetNaturesEvent event, Emitter<NaturesState> emit) async {
    try {
      emit(GetNaturesLoadingState());

      //Busco el token guardado en localstorage
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString("token");

      var data = await _repository.getNatures(token!);

      //Ordenamiento del resultado
      data.sort((a, b) => a.attributes.code.compareTo(b.attributes.code));

      emit(GetNaturesLoadedState(data: data));
    } catch (e) {
      emit(GetNaturesErrorState(errorMsg: e.toString()));
    }
  }
}
