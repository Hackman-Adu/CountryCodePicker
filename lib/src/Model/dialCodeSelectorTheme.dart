import 'package:dialcodeselector/src/Utils/packageUtils.dart';
import 'package:flutter/material.dart';

class DialCodeSelectorTheme {
  final Color? dialCodeColor;
  final Color? countryNameColor;
  final Color? titleColor;
  final FontWeight? titleFontWeight;
  final String? title;
  final Color? closeButtonColor;
  final bool? showCountriesOnly;
  final double? titleFontSize;
  final Color? backgroundColor;
  final Color? searchFieldBorderColor;
  final Color? searchFieldTextColor;
  final Color? checkedBoxColor;
  final double? sheetCornerRadius;
  DialCodeSelectorTheme(
      {this.showCountriesOnly = false,
      this.title = "Select Country",
      this.sheetCornerRadius = 11,
      this.titleFontWeight = FontWeight.bold,
      this.searchFieldBorderColor = PackageUtils.textColorBlack,
      this.searchFieldTextColor = PackageUtils.textColorBlack,
      this.backgroundColor = Colors.white,
      this.checkedBoxColor = Colors.green,
      this.closeButtonColor = PackageUtils.textColorBlack,
      this.titleFontSize = 21,
      this.titleColor = PackageUtils.textColorBlack,
      this.countryNameColor = PackageUtils.textColorBlack,
      this.dialCodeColor = PackageUtils.textColorBlack});
}
