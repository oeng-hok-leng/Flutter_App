import 'package:flutter/material.dart';
import 'package:food_app_flutter/constants.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    Key? key,
    required this.controller,
    required this.lable,
    required this.hintext,
    this.onSaved,
    this.type = TextInputType.text,
    required this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String lable;
  final String hintext;
  final TextInputType type;
  final IconData icon;
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      onSaved: onSaved,
      validator: (value) {
        if (value!.isEmpty) {
          return "x required!. please enter your email";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintext,
        hintStyle: const TextStyle(
          fontSize: 12,
          color: Constants.subTextColor,
        ),
        labelText: lable,
        labelStyle: const TextStyle(
          fontSize: 14,
          color: Constants.subTextColor,
        ),
        suffixIcon: Icon(
          icon,
          size: 16,
          color: Colors.black87,
        ),
        contentPadding: const EdgeInsets.only(left: 8),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: Constants.invalidColor,
          ),
        ),
        focusedBorder: null,
      ),
    );
  }
}
