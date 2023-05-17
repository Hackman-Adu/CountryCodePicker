import 'package:dialcodeselector/src/Model/country.dart';
import 'package:dialcodeselector/src/Utils/packageUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountryItemView extends StatelessWidget {
  final Country country;
  const CountryItemView(this.country, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        minLeadingWidth: 0,
        trailing: Text(country.dialCode ?? "",
            style: TextStyle(
                fontSize: 15,
                color: PackageUtils.textColorBlack.withOpacity(0.65))),
        leading: country.icon != null
            ? Image.asset(country.icon ?? "",
                height: 50, width: 18, package: PackageUtils.packageName)
            : const Icon(Icons.language_rounded,
                color: PackageUtils.textColorBlack),
        contentPadding:
            const EdgeInsets.only(right: 25, left: 25, bottom: 3, top: 3),
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          await HapticFeedback.mediumImpact();
          Navigator.of(context).pop(country);
        },
        title: Text(country.countryName ?? "",
            style: const TextStyle(
                fontSize: 17, color: PackageUtils.textColorBlack)),
      ),
      const Divider(height: 0)
    ]);
  }
}
