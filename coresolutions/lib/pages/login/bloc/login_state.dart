part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {}

class LoginErrorState extends LoginState {
  const LoginErrorState({
    required this.errorMsg,
  });

  final String? errorMsg;
}
