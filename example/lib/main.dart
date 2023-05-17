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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
              child: TextFormField(
            decoration: InputDecoration(
                hintText: "Enter phone number",
                prefixIcon: DialCodeSelector(callback: (selectedCountry) {
                  //use selectedCountry from callback here, Country logo is Null here
                  print("Selected Country: ${selectedCountry.countryName}");
                })),
            onChanged: (String value) {},
          )),
        ));
  }
}
