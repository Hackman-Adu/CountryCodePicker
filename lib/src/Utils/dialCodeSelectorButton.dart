import 'package:dialcodeselector/dialcodeselector.dart';
import 'package:dialcodeselector/src/Utils/packageUtils.dart';
import 'package:dialcodeselector/src/ViewModel/countryViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialCodeSelectorButton extends StatelessWidget {
  final Country country;
  final Function(Country selectedCountry)? onTap;
  const DialCodeSelectorButton(this.country, {this.onTap, super.key});

  CountryViewModel get viewModel => CountryViewModel.instance;

  void onSelectCountry(BuildContext context) async {
    FocusScope.of(context).unfocus();
    await HapticFeedback.mediumImpact();
    var country = await viewModel.selectCountry(context,
        initialCountryCode: this.country.dialCode);
    if (country == null) return;
    onTap?.call(country);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        padding: EdgeInsets.zero,
        elevation: 0,
        highlightElevation: 0,
        onPressed: () async {
          onSelectCountry(context);
        },
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(width: 11),
          Image.asset(country.icon ?? "",
              height: 21, width: 21, package: PackageUtils.packageName),
          const SizedBox(width: 5),
          Icon(Icons.arrow_drop_down,
              color: viewModel.selectorTheme.dropDownButtonColor),
          const SizedBox(width: 7),
          Padding(
            padding: const EdgeInsets.only(right: 13),
            child: Text(country.dialCode ?? "",
                style: TextStyle(
                    color: viewModel.selectorTheme.selectedDialCodeColor,
                    fontSize: 16)),
          )
        ]));
  }
}
