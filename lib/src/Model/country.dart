import 'package:dialcodeselector/src/ViewModel/countryViewModel.dart';
import 'package:collection/collection.dart';

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

  static Country? fromCountryDialCode(String? dialCode) {
    if (dialCode == null) return null;
    return CountryViewModel.instance.countries
        .singleWhereOrNull((element) => element.dialCode == dialCode);
  }
}
