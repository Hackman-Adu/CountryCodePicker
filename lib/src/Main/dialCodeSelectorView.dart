import 'package:dialcodeselector/src/Model/country.dart';
import 'package:dialcodeselector/src/Model/dialCodeSelectorTheme.dart';
import 'package:dialcodeselector/src/ViewModel/countryViewModel.dart';
import 'package:dialcodeselector/src/Views/countriesMainView.dart';
import 'package:flutter/material.dart';

class DialCodeSelector {
  static CountryViewModel get _viewModel => CountryViewModel.instance;

  static Future<void> selectCountry(BuildContext context,
      {String? initialShortName,
      DialCodeSelectorTheme? selectorTheme,
      Function(Country selectedCountry)? onCountrySelected}) async {
    Country? country = await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.black.withOpacity(0.75),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(7))),
        context: context,
        builder: (context) {
          return CountriesMainView(
              dialCodeSelectorTheme: selectorTheme,
              initialShortName: initialShortName);
        });
    if (country == null) return;
    onCountrySelected?.call(Country.forCallBack(country));
  }

  static Future<void> init() async => _viewModel.getCountries;

  static Country? getCountryByShortName({String? shortName}) =>
      _viewModel.getCountryByShortName(shortName: shortName);

  static Country? getCountryByDialCode({String? dialCode}) =>
      _viewModel.getCountryByDialCode(dialCode: dialCode);
}
