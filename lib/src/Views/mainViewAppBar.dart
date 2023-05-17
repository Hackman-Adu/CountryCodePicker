import 'package:dialcodeselector/src/Utils/packageUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainViewAppBar extends StatelessWidget {
  const MainViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(right: 16, left: 16, top: 21, bottom: 21),
        child: Row(children: [
          IconButton(
              splashRadius: 20,
              onPressed: () async {
                await HapticFeedback.mediumImpact();
                Navigator.of(context).pop();
              },
              icon: const Icon(CupertinoIcons.clear,
                  color: PackageUtils.textColorBlack)),
          const SizedBox(width: 11),
          const Text(
            "Select Country",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: PackageUtils.textColorBlack,
                fontSize: 21),
          )
        ]));
  }
}
