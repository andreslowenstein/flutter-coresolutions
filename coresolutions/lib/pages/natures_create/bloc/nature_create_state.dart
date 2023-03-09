part of 'nature_create_bloc.dart';

abstract class NatureCreateState extends Equatable {
  const NatureCreateState();

  @override
  List<Object> get props => [];
}

class NatureCreateInitial extends NatureCreateState {}

class NatureCreateLoadingState extends NatureCreateState {}

class NatureCreateLoadedState extends NatureCreateState {}

class NatureCreateErrorState extends NatureCreateState {
  const NatureCreateErrorState({
    required this.errorMsg,
  });

  final String? errorMsg;
}
