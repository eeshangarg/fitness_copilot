import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightTextField extends StatelessWidget {
  const WeightTextField({
    Key? key,
    required this.labelText,
    required this.helperText,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  final String labelText;
  final String helperText;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    RegExp positiveDecimalRegEx = RegExp(r'^([0-9]+\.?[0-9]*|\.[0-9]+)$');

    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: FaIcon(icon, size: 18.0),
        ),
        labelText: labelText,
        helperText: helperText,
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.allow(positiveDecimalRegEx)
      ],
    );
  }
}
