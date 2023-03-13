import 'dart:math' as math;
import 'package:flutter/material.dart';

class Responsive {
  late double _width;
  late double _height;
  late double _diagonal;

  late bool _isTablet;
  late bool _isWeb;

  double get width => _width;
  double get height => _height;
  double get diagonal => _diagonal;
  bool get isTablet => _isTablet;
  bool get isWeb => _isWeb;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
    _diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));

    _isTablet = size.shortestSide >= 768;
    _isWeb = size.shortestSide >= 1024;
  }

  double wp(double percent) => _width * percent / 100;
  double hp(double percent) => _height * percent / 100;
  double dp(double percent) => _diagonal * percent / 100;
}
