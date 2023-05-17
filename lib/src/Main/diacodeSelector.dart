import 'package:dialcodeselector/src/Model/country.dart';
import 'package:dialcodeselector/src/Utils/packageUtils.dart';
import 'package:dialcodeselector/src/ViewModel/countryViewModel.dart';
import 'package:dialcodeselector/src/Views/countriesMainView.dart';
import 'package:flutter/material.dart';

class DialCodeSelector {
  static Future<Country?> selectCountry(BuildContext context,
      {String? initialCountryCode}) async {
    await CountryViewModel.instance.getCountries;
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
