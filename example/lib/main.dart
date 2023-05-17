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
        appBar: AppBar(title: const Text("Home View")),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Selected Country ${selectedCountry?.countryName}"),
          const SizedBox(height: 30),
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
        ])));
  }
}
