import 'package:dialcodeselector/dialcodeselector.dart';
import 'package:flutter/material.dart';

void main() {
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

  Country? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selectedCountry != null)
              Row(mainAxisSize: MainAxisSize.min, children: [
                const SizedBox(width: 11),
                //INCLUDE THE PACKAGE NAME  IN Image.asset()
                Image.asset(selectedCountry?.icon ?? "",
                    height: 21, width: 21, package: "dialcodeselector"),
                const SizedBox(width: 7),
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: Text(selectedCountry?.dialCode ?? "",
                      style: const TextStyle(fontSize: 16)),
                )
              ]),
            TextButton(
                child: const Text("Choose Country"),
                onPressed: () async {
                  Country? value = await DialCodeSelector.selectCountry(context,
                      initialCountryCode: initialCountrCode);
                  if (value == null) return;
                  selectedCountry = value;
                  initialCountrCode = selectedCountry?.dialCode ?? "";
                  setState(() {});
                })
          ],
        )));
  }
}
