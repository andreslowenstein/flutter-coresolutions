import 'package:flutter/material.dart';

//Componente reciclable de textformfield
class CSTextFormField extends StatelessWidget {
  const CSTextFormField({
    super.key,
    this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.onPressed,
    this.error,
    this.obscureText,
  });

  final String? hint;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final void Function()? onPressed;
  final bool? error;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      key: key,
      style: Theme.of(context).textTheme.bodyMedium,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: .5,
            color: error!
                ? Theme.of(context).colorScheme.error
                : Theme.of(context).colorScheme.primary,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1),
        ),
        labelText: hint,
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.cancel_outlined,
            color: error!
                ? Theme.of(context).colorScheme.error
                : Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
