import 'package:coresolutions/UI/cs_textformfield.dart';
import 'package:flutter/material.dart';

class RestorePasswordPage extends StatelessWidget {
  RestorePasswordPage({Key? key}) : super(key: key);

  static const String route = "restore-password-page";

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var text = Theme.of(context).textTheme;
    var color = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/coreinvent.png"),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Restaurar contraseña",
                    style: text.headlineSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "No te preocupes, vamos a iniciar el proceso para restaurar tu contraseña",
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
                  CSTextFormField(
                    controller: _emailController,
                    error: false,
                    hint: "correo electrónico",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Introduce tu dirección de correo electrónico. Te enviaremos un mensaje con las instrucciones para restaurar tu contraseña.",
                    style: text.bodySmall,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // onPressed(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: color.primary),
                        child: Text(
                          "Enviar enlace  ",
                          style: text.labelLarge!.copyWith(
                            color: color.onPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(width: .5),
                          backgroundColor: color.onPrimary,
                        ),
                        child: Text(
                          "Cancelar ",
                          style: text.labelLarge!.copyWith(
                            color: color.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
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
