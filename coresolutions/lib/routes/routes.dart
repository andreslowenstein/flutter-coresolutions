import 'package:coresolutions/pages/login/restore_password_page.dart';
import 'package:coresolutions/pages/natures/natures_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routesArray =
      <String, WidgetBuilder>{
    NaturesPage.route: (_) => const NaturesPage(),
    RestorePasswordPage.route: (_) => RestorePasswordPage(),
  };
}
