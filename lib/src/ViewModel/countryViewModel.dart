import 'package:dialcodeselector/src/Model/country.dart';
import 'package:dialcodeselector/src/Model/dialCodeSelectorTheme.dart';
import 'package:dialcodeselector/src/Service/dialCodeSelectorService.dart';
import 'package:collection/collection.dart';

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
    return _countries.singleWhereOrNull((element) =>
        element.dialCode?.replaceAll("+", "") == dialCode?.replaceAll("+", ""));
  }

  Country? _getCountryByShortName({String? shortName}) {
    return _countries.singleWhereOrNull((element) =>
        element.countryShortName?.toLowerCase() == shortName?.toLowerCase());
  }
}
