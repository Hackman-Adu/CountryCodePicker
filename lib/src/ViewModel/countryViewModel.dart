import 'package:dialcodeselector/src/Model/country.dart';
import 'package:dialcodeselector/src/Model/dialCodeSelectorTheme.dart';
import 'package:dialcodeselector/src/Service/dialCodeSelectorService.dart';
import 'package:dialcodeselector/src/Utils/packageUtils.dart';

class CountryViewModel {
  CountryViewModel._();

  static final CountryViewModel _instance = CountryViewModel._();

  static CountryViewModel get instance => _instance;

  List<Country> _countries = [];

  List<Country> get countries => _countries;

  DialCodeSelectorTheme? selectorTheme = DialCodeSelectorTheme(
      showCountriesOnly: false,
      countryNameColor: PackageUtils.textColorBlack,
      dialCodeColor: PackageUtils.textColorBlack.withOpacity(0.65));

  Future<void> get getCountries async {
    var values = await DialCodeSelectorService.getCountries;
    this._countries = values;
  }
}
