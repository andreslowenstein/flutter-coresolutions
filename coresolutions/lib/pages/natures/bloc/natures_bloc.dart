import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';

part 'natures_event.dart';
part 'natures_state.dart';

class NaturesBloc extends Bloc<NaturesEvent, NaturesState> {
  NaturesBloc() : super(NaturesInitial()) {
    on<GetNaturesEvent>((event, emit) {
      _getNaturesEvent(event, emit);
    });
  }

  Future<void> _getNaturesEvent(
      GetNaturesEvent event, Emitter<NaturesState> emit) async {}
}
