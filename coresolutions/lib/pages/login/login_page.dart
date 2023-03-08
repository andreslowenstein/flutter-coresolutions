import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var text = Theme.of(context).textTheme;
    var color = Theme.of(context).colorScheme;
    return Scaffold(
      body: Padding(
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
                        color: color.primary, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 10.0,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
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
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 10.0,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
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
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Text(
                "¿Has olvidado la contraseña?",
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
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: color.primary),
                child: Text(
                  "Acceder",
                  style: text.labelLarge!.copyWith(
                    color: color.onPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
