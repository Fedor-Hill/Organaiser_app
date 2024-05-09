import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      required this.textInputType,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.labelText,
      required this.hintText,
      required this.obscureText,
      required this.validator});

  final TextEditingController controller;
  final TextInputType textInputType;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final String? labelText, hintText;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        cursorColor: Theme.of(context).colorScheme.primary,
        obscureText: obscureText,
        keyboardType: textInputType,
        decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onBackground),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            labelText: labelText,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon),
        validator: validator,
      );
}
