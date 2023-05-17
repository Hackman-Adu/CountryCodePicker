import 'package:flutter/material.dart';

class DialCodeSelectorTheme {
  final Color? dialCodeColor;
  final Color? countryNameColor;
  final bool? showCountriesOnly;
  DialCodeSelectorTheme(
      {this.dialCodeColor,
      this.countryNameColor,
      this.showCountriesOnly = false});
}
