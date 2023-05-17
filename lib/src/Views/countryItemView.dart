import 'package:dialcodeselector/src/Model/country.dart';
import 'package:dialcodeselector/src/Utils/packageUtils.dart';
import 'package:dialcodeselector/src/ViewModel/countryViewModel.dart';
import 'package:flutter/material.dart';

class CountryItemView extends StatelessWidget {
  final Country country;
  const CountryItemView(this.country, {super.key});

  CountryViewModel get viewModel => CountryViewModel.instance;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        minLeadingWidth: 0,
        trailing: !viewModel.selectorTheme!.showCountriesOnly!
            ? Text(country.dialCode ?? "",
                style: TextStyle(
                    fontSize: 15,
                    color: viewModel.selectorTheme?.dialCodeColor))
            : const Icon(Icons.chevron_right, size: 18),
        leading: country.icon != null
            ? Image.asset(country.icon ?? "",
                height: 50, width: 18, package: PackageUtils.packageName)
            : const Icon(Icons.language_rounded,
                color: PackageUtils.textColorBlack),
        contentPadding:
            const EdgeInsets.only(right: 25, left: 25, bottom: 3, top: 3),
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          Navigator.of(context).pop(country);
        },
        title: Text(country.countryName ?? "",
            style: TextStyle(
                fontSize: 17,
                color: viewModel.selectorTheme?.countryNameColor)),
      ),
      const Divider(height: 0)
    ]);
  }
}
