import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.icon,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: icon,
        ),
        hintText: hintText,
      ),
      keyboardType: TextInputType.text,
      controller: controller,
    );
  }
}
