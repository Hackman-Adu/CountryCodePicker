import 'package:dialcodeselector/src/Model/country.dart';
import 'package:dialcodeselector/src/Model/dialCodeSelectorTheme.dart';
import 'package:dialcodeselector/src/ViewModel/countryViewModel.dart';
import 'package:flutter/material.dart';

class DialCodeSelector {
  static CountryViewModel get _viewModel => CountryViewModel.instance;

  static Future<void> selectCountry(BuildContext context,
      {String? initialShortName,
      DialCodeSelectorTheme? selectorTheme,
      Function(Country? selectedCountry)? onCountrySelected}) async {
    _viewModel.selectCountry(context,
        initialShortName: initialShortName,
        selectorTheme: selectorTheme,
        onCountrySelected: onCountrySelected);
  }

  static Future<void> init() async => _viewModel.getCountries;

  static Country? getCountryByShortName({String? shortName}) =>
      _viewModel.getCountryByShortName(shortName: shortName);

  static Country? getCountryByDialCode({String? dialCode}) =>
      _viewModel.getCountryByDialCode(dialCode: dialCode);
}
