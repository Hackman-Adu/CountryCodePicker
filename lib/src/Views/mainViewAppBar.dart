import 'package:dialcodeselector/src/ViewModel/countryViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainViewAppBar extends StatelessWidget {
  const MainViewAppBar({super.key});

  CountryViewModel get viewModel => CountryViewModel.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(right: 16, left: 16, top: 21, bottom: 21),
        child: Row(children: [
          IconButton(
              splashRadius: 20,
              onPressed: () async {
                Navigator.of(context).pop();
              },
              icon: Icon(CupertinoIcons.clear,
                  color: viewModel.selectorTheme?.closeButtonColor)),
          const SizedBox(width: 11),
          Text(viewModel.selectorTheme?.title ?? "N/A",
              style: TextStyle(
                  fontWeight: viewModel.selectorTheme?.titleFontWeight,
                  color: viewModel.selectorTheme?.titleColor,
                  fontSize: viewModel.selectorTheme?.titleFontSize))
        ]));
  }
}
