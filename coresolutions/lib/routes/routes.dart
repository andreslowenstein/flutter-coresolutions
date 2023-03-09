import 'package:coresolutions/pages/natures/natures_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routesArray =
      <String, WidgetBuilder>{
    NaturesPage.route: (_) => const NaturesPage(),
  };
}
