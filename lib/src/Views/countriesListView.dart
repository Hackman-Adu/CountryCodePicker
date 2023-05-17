import 'package:dialcodeselector/src/Model/country.dart';
import 'package:dialcodeselector/src/Views/countryItemView.dart';
import 'package:flutter/material.dart';

class CountriesListView extends StatelessWidget {
  final List<Country> countries;
  const CountriesListView(this.countries, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 50),
          itemCount: countries.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var country = countries[index];
            return CountryItemView(country);
          }),
    );
  }
}
