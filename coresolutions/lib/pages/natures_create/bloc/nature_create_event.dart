part of 'nature_create_bloc.dart';

class NatureCreateInitialEvent extends Equatable {
  const NatureCreateInitialEvent();

  @override
  List<Object> get props => [];
}

class NatureCreateEvent extends NatureCreateInitialEvent {
  const NatureCreateEvent({
    required this.code,
    required this.alias,
    required this.description,
  });

  final String code;
  final String alias;
  final String description;

  @override
  List<Object> get props => [];
}

class GoBackEvent extends NatureCreateInitialEvent {
  const GoBackEvent();

  @override
  List<Object> get props => [];
}
