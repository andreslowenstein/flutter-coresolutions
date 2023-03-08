// import 'package:flutter/material.dart';

// class CSTextFormField extends StatelessWidget {
//   const CSTextFormField({
//     super.key,
//     this.hint,
//     this.suffixIcon,
//     this.prefixIcon,
//     this.validator,
//     this.controller,
//     this.onSaved,
//   });

//   final String? hint;
//   final Icon? suffixIcon;
//   final Icon? prefixIcon;
//   final String? Function(String?)? validator;
//   final TextEditingController? controller;
//   final Function(String?)? onSaved;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator: validator,
//       onSaved: onSaved,
//       controller: controller,
//       key: key,
//       style: Theme.of(context).textTheme.bodyMedium,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Theme.of(context).colorScheme.onPrimary,
//         label: Text(
//           '${this.placeHolder ?? ''}',
//           textAlign: this.textAlign,
//           style: this.placeHolderStyle ??
//               Theme.of(context).inputDecorationTheme.labelStyle,
//         ),
//         prefixIcon: this.prefixIcon,
//         suffixIcon: this.suffixIcon,
//         enabledBorder: const OutlineInputBorder(
//           borderSide:
//               BorderSide(color: Color.fromARGB(255, 199, 199, 199), width: 1.5),
//         ),
//         focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
//         disabledBorder: Theme.of(context).inputDecorationTheme.disabledBorder,
//       ),
//       inputFormatters: this.inputFormatters,
//     );
//   }
// }
