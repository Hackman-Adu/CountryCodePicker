import 'package:dialcodeselector/src/Utils/packageUtils.dart';
import 'package:flutter/material.dart';

class SearchCountryTextField extends StatelessWidget {
  final dynamic onChange;
  final String? hintText;
  const SearchCountryTextField({this.onChange, this.hintText, super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(right: 13, left: 13, bottom: 21),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        color: PackageUtils.textColorBlack.withOpacity(0.05),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 3),
          child: Row(children: [
            const Icon(Icons.search, color: PackageUtils.textColorBlack),
            const SizedBox(width: 11),
            Expanded(
                child: TextFormField(
              textInputAction: TextInputAction.done,
              style: const TextStyle(
                  fontSize: 17, color: PackageUtils.textColorBlack),
              cursorColor: PackageUtils.textColorBlack,
              onChanged: onChange,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: PackageUtils.textColorBlack.withOpacity(0.5)),
                  border: InputBorder.none),
            ))
          ]),
        ));
  }
}
