import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RepTextField extends StatefulWidget {
  const RepTextField({
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
  State<RepTextField> createState() => _RepTextFieldState();
}

class _RepTextFieldState extends State<RepTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: const TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: FaIcon(widget.icon, size: 18.0),
        ),
        labelText: widget.labelText,
        helperText: widget.helperText,
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}
