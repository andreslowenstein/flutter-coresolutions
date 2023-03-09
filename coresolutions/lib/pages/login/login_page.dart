import 'package:coresolutions/pages/login/bloc/login_bloc.dart';
import 'package:coresolutions/pages/natures/natures_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void onPressed(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(LoginEvent(
        email: _emailController.text, password: _passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    var text = Theme.of(context).textTheme;
    var color = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/coreinvent.png"),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "¡Hola!",
                    style: text.headlineSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Utiliza tus credenciales de usuario para acceder al sistema",
                    style: text.bodyMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.language_outlined),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Español",
                        style: text.bodyMedium,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        child: Text(
                          "Cambiar",
                          style: text.bodyMedium!.copyWith(
                              color: color.primary,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginErrorState) {
                        return LoginFormError(
                          emailController: _emailController,
                          color: color,
                          passwordController: _passwordController,
                          text: text,
                          errorMsg: state.errorMsg,
                        );
                      }
                      if (state is LoginLoadedState) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.pushNamed(context, NaturesPage.route);
                        });
                      }
                      return LoginForm(
                          emailController: _emailController,
                          passwordController: _passwordController);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: Text(
                      "¿Has olvidado la contraseña?",
                      //TODO HACER SCREEN
                      style: text.labelLarge!.copyWith(
                          color: color.primary, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Si no dispones de una cuenta de usuario o tienes problemas para acceder, ponte en contacto con tu administrador.",
                    style: text.bodySmall,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            onPressed(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: color.primary),
                          child: Text(
                            "Acceder",
                            style: text.labelLarge!.copyWith(
                              color: color.onPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10.0,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: .5),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1),
            ),
            labelText: "correo electrónico",
            suffixIcon: GestureDetector(
              child: const Icon(Icons.cancel_outlined),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10.0,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: .5),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1),
            ),
            labelText: "contraseña",
            suffixIcon: GestureDetector(
              child: const Icon(Icons.cancel_outlined),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginFormError extends StatelessWidget {
  const LoginFormError({
    Key? key,
    required TextEditingController emailController,
    required this.color,
    required TextEditingController passwordController,
    required this.text,
    this.errorMsg,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _emailController;
  final ColorScheme color;
  final TextEditingController _passwordController;
  final TextTheme text;
  final String? errorMsg;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10.0,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: color.error),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1),
            ),
            labelText: "correo electrónico",
            suffixIcon: GestureDetector(
              child: Icon(
                Icons.cancel_outlined,
                color: color.error,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10.0,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: color.error),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1),
            ),
            labelText: "contraseña",
            suffixIcon: GestureDetector(
              child: Icon(
                Icons.cancel_outlined,
                color: color.error,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            errorMsg!,
            style: text.bodySmall!.copyWith(color: color.error),
          ),
        ),
      ],
    );
  }
}
