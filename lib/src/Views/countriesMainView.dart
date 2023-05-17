import 'package:dialcodeselector/src/Model/country.dart';
import 'package:dialcodeselector/src/Model/dialCodeSelectorTheme.dart';
import 'package:dialcodeselector/src/ViewModel/countryViewModel.dart';
import 'package:dialcodeselector/src/Views/countriesListView.dart';
import 'package:dialcodeselector/src/Views/mainViewAppBar.dart';
import 'package:dialcodeselector/src/Views/searchCountryTextField.dart';
import 'package:dialcodeselector/src/Views/selectedCountryItemView.dart';
import 'package:flutter/material.dart';

class CountriesMainView extends StatefulWidget {
  final String? initialShortName;
  final DialCodeSelectorTheme? dialCodeSelectorTheme;
  const CountriesMainView(
      {this.initialShortName, this.dialCodeSelectorTheme, super.key});

  @override
  State<CountriesMainView> createState() => _CountriesMainViewState();
}

class _CountriesMainViewState extends State<CountriesMainView> {
  List<Country> _countries = [];

  List<Country> _filteredCountries = [];

  CountryViewModel get viewModel => CountryViewModel.instance;

  late String? _initialCountryCode;

  void onSearchCountry(String value) {
    if (value.trim().trim().isEmpty) {
      _filteredCountries = _countries;
    } else {
      _filteredCountries = _countries
          .where((element) =>
              element.countryName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _countries = viewModel.countries;
    _filteredCountries = _countries;
    _initialCountryCode = widget.initialShortName;
    if (widget.dialCodeSelectorTheme != null) {
      viewModel.selectorTheme = widget.dialCodeSelectorTheme;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
            margin: const EdgeInsets.only(top: 60),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
                color: Colors.white),
            child: Column(children: [
              const MainViewAppBar(),
              SearchCountryTextField(
                  onChange: onSearchCountry, hintText: "Search country"),
              Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: SelectedCountryItemView(
                      Country.fromCountryShortName(_initialCountryCode))),
              Expanded(child: CountriesListView(_filteredCountries))
            ])));
  }
}
