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

  /// use this factory to use asset images in this package, by passing Country
  factory Country.forCallBack(Country? country) {
    return Country(
        countryShortName: country?.countryShortName,
        dialCode: country?.dialCode,
        icon:
            "packages/${PackageUtils.packageName}/asset/images/${country?.countryShortName?.toLowerCase()}.png",
        countryName: country?.countryName);
  }
}
