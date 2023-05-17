import 'package:dialcodeselector/dialcodeselector.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialise the countries
  await CountryViewModel.instance.initialiseCountries;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Package Example App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeView());
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? initialCountrCode;

  Country selectedCountry = Country.setDefaultCountry(Country(
      countryName: "Ghana",
      countryShortName: "gh",
      dialCode: "+233",
      icon: "asset/images/gh.png"));

  void onCountrySelected(Country country) {
    selectedCountry = country;
    setState(() {});
  }

  DialCodeSelectorTheme theme = DialCodeSelectorTheme(showCountriesOnly: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
              child: TextFormField(
            decoration: InputDecoration(
                hintText: "Enter phone number",
                prefixIcon: MaterialButton(
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    highlightElevation: 0,
                    onPressed: () async {
                      await DialCodeSelector.selectCountry(context,
                          selectorTheme: theme,
                          initialCountryCode: selectedCountry.dialCode,
                          onCountrySelected: onCountrySelected);
                    },
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      const SizedBox(width: 11),
                      Image.asset(selectedCountry.icon ?? "",
                          height: 21, width: 21),
                      const SizedBox(width: 5),
                      const Icon(Icons.arrow_drop_down),
                      const SizedBox(width: 7),
                      Padding(
                          padding: const EdgeInsets.only(right: 13),
                          child: Text(selectedCountry.dialCode ?? "",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16)))
                    ]))),
            onChanged: (String value) {},
          )),
        ));
  }
}
