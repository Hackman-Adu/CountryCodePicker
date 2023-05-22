import 'package:dialcodeselector/src/Model/country.dart';
import 'package:dialcodeselector/src/Model/dialCodeSelectorTheme.dart';
import 'package:dialcodeselector/src/Service/dialCodeSelectorService.dart';
import 'package:dialcodeselector/src/Views/countriesMainView.dart';
import 'package:flutter/material.dart';

class CountryViewModel {
  CountryViewModel._();

  static final CountryViewModel _instance = CountryViewModel._();

  static CountryViewModel get instance => _instance;

  Country? selectedCountry;

  List<Country> _countries = [];

  List<Country> get countries => _countries;

  DialCodeSelectorTheme? selectorTheme = DialCodeSelectorTheme();

  Future<void> get getCountries async {
    var values = await DialCodeSelectorService.getCountries;
    this._countries = values;
  }

  Future<void> selectCountry(BuildContext context,
      {String? initialShortName,
      DialCodeSelectorTheme? selectorTheme,
      Function(Country? selectedCountry)? onCountrySelected}) async {
    Country? country = await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.black.withOpacity(0.75),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(selectorTheme?.sheetCornerRadius ?? 11))),
        context: context,
        builder: (context) {
          return CountriesMainView(
              dialCodeSelectorTheme: selectorTheme,
              initialShortName: initialShortName);
        });
    if (country == null) return;
    onCountrySelected?.call(Country.forCallBack(country));
  }

  Country? getCountryByShortName({String? shortName}) =>
      Country.forCallBack(_getCountryByShortName(shortName: shortName));

  Country? getCountryByDialCode({String? dialCode}) =>
      Country.forCallBack(_getCountryByDialCode(dialCode: dialCode));

  Country? _getCountryByDialCode({String? dialCode}) {
    try {
      return _countries.singleWhere((element) =>
          element.dialCode?.replaceAll("+", "") ==
          dialCode?.replaceAll("+", "").replaceAll(" ", ""));
    } catch (e) {
      return null;
    }
  }

  Country? _getCountryByShortName({String? shortName}) {
    try {
      return _countries.singleWhere((element) =>
          element.countryShortName?.toLowerCase() ==
          shortName?.toLowerCase().replaceAll(" ", ""));
    } catch (e) {
      return null;
    }
  }
}
