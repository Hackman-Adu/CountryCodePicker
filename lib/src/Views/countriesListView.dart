import 'package:dialcodeselector/src/Model/country.dart';
import 'package:dialcodeselector/src/ViewModel/countryViewModel.dart';
import 'package:dialcodeselector/src/Views/countryItemView.dart';
import 'package:flutter/material.dart';

class CountriesListView extends StatelessWidget {
  final List<Country> countries;
  const CountriesListView(this.countries, {super.key});

  CountryViewModel get viewModel => CountryViewModel.instance;

  Country? get selectedCountry => viewModel.selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 50),
          itemCount: countries.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var country = countries[index];
            if (selectedCountry?.dialCode == country.dialCode) {
              return const SizedBox();
            }
            return CountryItemView(country);
          }),
    );
  }
}
