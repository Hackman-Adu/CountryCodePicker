import 'package:flutter/material.dart';

class SelectedCountryCheckBox extends StatelessWidget {
  final bool? isChecked;
  const SelectedCountryCheckBox({Key? key, this.isChecked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 23,
          width: 23,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 0.5),
              shape: BoxShape.circle,
              color: Colors.white),
        ),
        isChecked! ? const CheckedView() : const SizedBox()
      ],
    );
  }
}

class CheckedView extends StatelessWidget {
  const CheckedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 23,
        width: 23,
        child: const Icon(Icons.check, color: Colors.white, size: 15),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 0.5),
            shape: BoxShape.circle,
            color: Colors.green));
  }
}
