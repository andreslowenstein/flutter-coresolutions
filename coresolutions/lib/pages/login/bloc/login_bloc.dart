import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:coresolutions/repository/repository.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Repository _repository;

  LoginBloc(this._repository) : super(const LoginState()) {
    on<LoginEvent>(
      (event, emit) async {
        await _loginEvent(event, emit);
      },
    );
  }

  Future<void> _loginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    if (event.email == "" || EmailValidator.validate(event.email) == false) {
      emit(
        const LoginErrorState(errorMsg: "Por favor ingresa un email válido."),
      );
      return;
    }
    if (event.password == "") {
      emit(
        const LoginErrorState(errorMsg: "Por favor ingresa una clave."),
      );
      return;
    }

    try {
      emit(LoginLoadingState());

      String token = await _repository.login(event.email, event.password);

      //Guardo el token en el localstorage
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('action', token);

      emit(LoginLoadedState());
    } on DioError catch (e) {
      emit(LoginErrorState(errorMsg: e.response!.data));
    }
  }
}
