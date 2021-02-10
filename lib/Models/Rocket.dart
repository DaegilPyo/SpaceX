import 'package:flutter/material.dart';

class Rocket {
  Rocket({
    @required this.imgPath,
    @required this.name,
    @required this.summary,
    @required this.isActivated,
  });
  final String name;
  final String imgPath;
  final String summary;
  final bool isActivated;
}
