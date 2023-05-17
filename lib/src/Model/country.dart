import 'package:dialcodeselector/src/Utils/packageUtils.dart';
import 'package:dialcodeselector/src/ViewModel/countryViewModel.dart';

class Country {
  String? countryName;
  String? dialCode;
  String? countryShortName;
  String? icon;
  Country({this.countryName, this.icon, this.dialCode, this.countryShortName});

  factory Country.fromJSON(Map<String, dynamic> json) {
    return Country(
        countryShortName: json['code'],
        dialCode: json['dial_code'],
        icon: "asset/images/${json['code']?.toString().toLowerCase()}.png",
        countryName: json['name']);
  }

  factory Country.forCallBack(Country? country) {
    return Country(
        countryShortName: country?.countryShortName,
        dialCode: country?.dialCode,
        icon: "packages/${PackageUtils.packageName}/${country?.icon}",
        countryName: country?.countryName);
  }

  static Country? fromCountryShortName(String? shortName) {
    if (shortName == null) return null;
    try {
      return CountryViewModel.instance.countries.singleWhere((element) =>
          element.countryShortName?.toLowerCase() == shortName.toLowerCase());
    } catch (e) {
      return null;
    }
  }

  static Country setDefaultCountry(Country country) {
    return Country(
        dialCode: country.dialCode,
        countryName: country.countryName,
        countryShortName: country.countryShortName,
        icon: country.icon);
  }
}
