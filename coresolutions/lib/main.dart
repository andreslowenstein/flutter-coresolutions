import 'package:coresolutions/pages/login/login_page.dart';
import 'package:flutter/material.dart';

import 'package:coresolutions/themes/theme_dark.dart';
import 'package:coresolutions/themes/theme_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true, colorScheme: lightColorScheme.colorScheme),
      darkTheme: ThemeData(
          useMaterial3: true, colorScheme: darkColorScheme.colorScheme),
      home: const LoginPage(),
    );
  }
}

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 2,
//           title: const Text("Material Theme Builder"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Update with your UI',
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton:
//             FloatingActionButton(onPressed: () => {}, tooltip: 'Increment'));
//   }
// }
