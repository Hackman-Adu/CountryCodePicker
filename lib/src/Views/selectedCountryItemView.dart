import 'package:dialcodeselector/src/Model/country.dart';
import 'package:dialcodeselector/src/Utils/packageUtils.dart';
import 'package:dialcodeselector/src/Utils/selectedCountryCheckBox.dart';
import 'package:dialcodeselector/src/ViewModel/countryViewModel.dart';
import 'package:flutter/material.dart';

class SelectedCountryItemView extends StatelessWidget {
  final Country? country;
  const SelectedCountryItemView({this.country, super.key});

  CountryViewModel get viewModel => CountryViewModel.instance;

  @override
  Widget build(BuildContext context) {
    if (country == null) return const SizedBox(height: 0);
    return Column(children: [
      ListTile(
        onTap: () {
          Navigator.of(context).pop(null);
        },
        minLeadingWidth: 0,
        leading: country?.icon != null
            ? Image.asset(country?.icon ?? "",
                height: 50, width: 18, package: PackageUtils.packageName)
            : Icon(Icons.language_rounded,
                color: viewModel.selectorTheme?.countryNameColor),
        contentPadding:
            const EdgeInsets.only(right: 25, left: 25, bottom: 11, top: 3),
        trailing: const SelectedCountryCheckBox(isChecked: true),
        title: Text(country?.countryName ?? "",
            style: TextStyle(
                fontSize: 17,
                color: viewModel.selectorTheme?.countryNameColor)),
      ),
      const Divider(height: 0)
    ]);
  }
}
