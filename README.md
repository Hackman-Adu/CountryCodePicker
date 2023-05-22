# dialcodeselector Package

Package designed to select either country or country dial code

<img src="https://github.com/Hackman-Adu/CountryCodePicker/assets/59240626/a5469a8b-7d98-4a09-8558-09ca14fc3207" width="49.5%" /> <img src="https://github.com/Hackman-Adu/CountryCodePicker/assets/59240626/c00fe7da-3e98-451a-9862-021f49140669" width="49.5%" /><img src="https://github.com/Hackman-Adu/CountryCodePicker/assets/59240626/b74ca391-678b-48c1-9d03-65edc496f086" width="49.5%" />

## pubspec.yaml

```yaml
dialcodeselector: <last version>
```

## import

```dart
import 'package:dialcodeselector/dialcodeselector.dart';
```

## Simple example

```dart
//Define your default country
Country? defaultCountry = DialCodeSelector.getCountryByDialCode(dialCode: "233");

//implement callback
  void onCountrySelected(Country? country) {
    defaultCountry = country;
    setState(() {});
  }

// Define theme for the country code picker
  DialCodeSelectorTheme get selectorTheme =>
      DialCodeSelectorTheme(titleColor: Colors.blueGrey);

void showCountryPicker()async{
 await DialCodeSelector.selectCountry(BuildContext,
                            selectorTheme: selectorTheme,
                            initialShortName: defaultCountry?.countryShortName,
                            onCountrySelected: onCountrySelected);
}
```

## Features

- Selecting a country dial code
- Selecting a country
- Returns selected Country name, logo, shortname and dial code
- Get country by shortname
- Get country by dialcode
