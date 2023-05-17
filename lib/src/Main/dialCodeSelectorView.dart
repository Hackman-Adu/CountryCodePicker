import 'package:dialcodeselector/dialcodeselector.dart';
import 'package:dialcodeselector/src/Utils/dialCodeSelectorButton.dart';
import 'package:dialcodeselector/src/ViewModel/countryViewModel.dart';
import 'package:flutter/material.dart';

class DialCodeSelector extends StatefulWidget {
  final bool? showCountriesOnly;
  final DialCodeSelectorTheme? dialCodeSelectorTheme;
  final Function(Country selectedCountry)? callback;
  const DialCodeSelector(
      {this.showCountriesOnly = false,
      this.dialCodeSelectorTheme,
      this.callback,
      super.key});

  @override
  State<DialCodeSelector> createState() => _DialCodeSelectorState();
}

class _DialCodeSelectorState extends State<DialCodeSelector> {
  Country selectedCountry = Country.defaultCountry;

  void onCountrySelected(Country selectedCountry) async {
    this.selectedCountry = selectedCountry;
    widget.callback?.call(Country.forCallBack(selectedCountry));
    setState(() {});
  }

  CountryViewModel get viewModel => CountryViewModel.instance;

  @override
  void initState() {
    super.initState();
    viewModel.showCountriesOnly = widget.showCountriesOnly;
    if (widget.dialCodeSelectorTheme != null) {
      viewModel.selectorTheme = widget.dialCodeSelectorTheme!;
    }
  }

  @override
  Widget build(BuildContext context) =>
      DialCodeSelectorButton(selectedCountry, onTap: onCountrySelected);
}
