import 'package:dialcodeselector/src/Utils/packageUtils.dart';

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

//USED WHEN COUNTRY IS NOT FOUND BY EITHER DIALCODE OR SHORTNAME
  static Country get _defaultCountry => Country(
      countryName: "Ghana",
      icon: "packages/${PackageUtils.packageName}/asset/images/gh.png",
      countryShortName: "GH",
      dialCode: "+233");

  static Country? forCallBack(Country? country) {
    if (country == null) return _defaultCountry;
    return Country(
        countryShortName: country.countryShortName,
        dialCode: country.dialCode,
        icon:
            "packages/${PackageUtils.packageName}/asset/images/${country.countryShortName?.toLowerCase()}.png",
        countryName: country.countryName);
  }
}
