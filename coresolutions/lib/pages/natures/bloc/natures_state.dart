part of 'natures_bloc.dart';

@immutable
class NaturesState extends Equatable {
  const NaturesState();

  @override
  List<Object> get props => [];
}

class GetNaturesLoadingState extends NaturesState {}

class GetNaturesLoadedState extends NaturesState {
  const GetNaturesLoadedState({
    required this.data,
  });

  final List<Nature> data;

  @override
  List<Object> get props => [data];
}

class GetNaturesErrorState extends NaturesState {
  const GetNaturesErrorState({
    required this.errorMsg,
  });

  final String? errorMsg;
}
