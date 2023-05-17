import 'package:dialcodeselector/src/Model/country.dart';
import 'package:dialcodeselector/src/Model/dialCodeSelectorTheme.dart';
import 'package:dialcodeselector/src/Service/dialCodeSelectorService.dart';
import 'package:dialcodeselector/src/Utils/packageUtils.dart';
import 'package:dialcodeselector/src/Views/countriesMainView.dart';
import 'package:flutter/material.dart';

class CountryViewModel {
  CountryViewModel._();

  static final CountryViewModel _instance = CountryViewModel._();

  static CountryViewModel get instance => _instance;

  List<Country> _countries = [];

  List<Country> get countries => _countries;

  bool? showCountriesOnly = false;

  DialCodeSelectorTheme selectorTheme = DialCodeSelectorTheme(
      selectedDialCodeColor: PackageUtils.textColorBlack,
      dropDownButtonColor: PackageUtils.textColorBlack,
      countryNameColor: PackageUtils.textColorBlack,
      dialCodeColor: PackageUtils.textColorBlack.withOpacity(0.65));

  Future<void> get _getCountries async {
    var values = await DialCodeSelectorService.getCountries;
    this._countries = values;
  }

  Future<Country?> selectCountry(BuildContext context,
      {String? initialCountryCode}) async {
    await _getCountries;
    return await Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        barrierColor: PackageUtils.textColorBlack..withOpacity(0.5),
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, startAnimation, endAnimation, child) {
          return SlideTransition(
              position:
                  Tween<Offset>(end: Offset.zero, begin: const Offset(0, 1))
                      .animate(startAnimation),
              child: child);
        },
        reverseTransitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, startAnimation, endAnimation) {
          return CountriesMainView(initialCountryCode: initialCountryCode);
        }));
  }
}
