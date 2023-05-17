import 'package:dialcodeselector/src/Model/country.dart';
import 'package:dialcodeselector/src/Utils/packageUtils.dart';
import 'package:dialcodeselector/src/Utils/selectedCountryCheckBox.dart';
import 'package:flutter/material.dart';

class SelectedCountryItemView extends StatelessWidget {
  final Country? country;
  const SelectedCountryItemView(this.country, {super.key});

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
            : const Icon(Icons.language_rounded,
                color: PackageUtils.textColorBlack),
        contentPadding:
            const EdgeInsets.only(right: 25, left: 25, bottom: 11, top: 3),
        trailing: const SelectedCountryCheckBox(isChecked: true),
        title: Text(country?.countryName ?? "",
            style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                color: PackageUtils.textColorBlack)),
      ),
      const Divider(height: 0)
    ]);
  }
}
