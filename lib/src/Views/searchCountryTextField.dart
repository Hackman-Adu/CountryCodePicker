import 'package:dialcodeselector/src/Utils/packageUtils.dart';
import 'package:dialcodeselector/src/ViewModel/countryViewModel.dart';
import 'package:flutter/material.dart';

class SearchCountryTextField extends StatelessWidget {
  final dynamic onChange;
  final String? hintText;
  const SearchCountryTextField({this.onChange, this.hintText, super.key});

  CountryViewModel get viewModel => CountryViewModel.instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(right: 21, left: 21, bottom: 21, top: 11),
        child: TextFormField(
          textInputAction: TextInputAction.done,
          style: TextStyle(
              fontSize: 17,
              color: viewModel.selectorTheme?.searchFieldTextColor),
          cursorColor: viewModel.selectorTheme?.searchFieldTextColor,
          onChanged: onChange,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                      color: (viewModel.selectorTheme?.searchFieldTextColor ??
                              PackageUtils.textColorBlack)
                          .withOpacity(0.15))),
              prefixIcon: Icon(Icons.search,
                  color: viewModel.selectorTheme?.searchFieldTextColor),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                      width: 1.5,
                      color: (viewModel.selectorTheme?.searchFieldTextColor ??
                          PackageUtils.textColorBlack))),
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: 17,
                  color: (viewModel.selectorTheme?.searchFieldTextColor)
                      ?.withOpacity(0.5)),
              border: InputBorder.none),
        ));
  }
}
