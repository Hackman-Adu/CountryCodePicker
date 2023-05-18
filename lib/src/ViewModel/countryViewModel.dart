import 'package:dialcodeselector/src/Model/country.dart';
import 'package:dialcodeselector/src/Model/dialCodeSelectorTheme.dart';
import 'package:dialcodeselector/src/Service/dialCodeSelectorService.dart';

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

  Country? getCountryByShortName({String? shortName}) =>
      Country.forCallBack(_getCountryByShortName(shortName: shortName));

  Country? getCountryByDialCode({String? dialCode}) =>
      Country.forCallBack(_getCountryByDialCode(dialCode: dialCode));

  Country? _getCountryByDialCode({String? dialCode}) {
    try {
      return _countries.singleWhere((element) =>
          element.dialCode?.replaceAll("+", "") ==
          dialCode?.replaceAll("+", ""));
    } catch (e) {
      return null;
    }
  }

  Country? _getCountryByShortName({String? shortName}) {
    try {
      return _countries.singleWhere((element) =>
          element.countryShortName?.toLowerCase() == shortName?.toLowerCase());
    } catch (e) {
      return null;
    }
  }
}
