import 'package:dialcodeselector/src/Model/country.dart';
import 'package:dialcodeselector/src/Utils/packageUtils.dart';
import 'package:dialcodeselector/src/ViewModel/countryViewModel.dart';
import 'package:dialcodeselector/src/Views/countriesMainView.dart';
import 'package:flutter/material.dart';

class DialCodeSelector {
  static Future<Country?> selectCountry(BuildContext context,
      {String? initialCountryCode}) async {
    await CountryViewModel.instance.getCountries;
    return await showGeneralDialog(
        barrierColor: PackageUtils.textColorBlack..withOpacity(0.04),
        barrierLabel: '',
        transitionBuilder: (context, startAnimation, endAnimation, child) {
          return ScaleTransition(child: child, scale: startAnimation);
        },
        transitionDuration: const Duration(milliseconds: 200),
        context: context,
        pageBuilder: (context, startAnimation, endAnimation) {
          return CountriesMainView(initialCountryCode: initialCountryCode);
        });
  }
}
