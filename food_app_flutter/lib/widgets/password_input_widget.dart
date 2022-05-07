import 'package:flutter/material.dart';
import 'package:food_app_flutter/constants.dart';

class PasswordInputWidget extends StatefulWidget {
  const PasswordInputWidget({
    Key? key,
    required this.controller,
    this.label = "password",
    this.hintText = "",
    this.type = TextInputType.visiblePassword,
    this.onSaved,
    this.isLoginPage = true,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String hintText;
  final TextInputType type;

  final Function(String?)? onSaved;
  final bool isLoginPage;

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  var isShow = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.type,
      obscureText: !isShow,
      onSaved: widget.onSaved,
      obscuringCharacter: "*",
      validator: (value) {
        if (value!.isEmpty) {
          return "x required!. please enter your passowrd";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 12,
          color: Constants.subTextColor,
        ),
        labelText: widget.label,
        labelStyle: const TextStyle(
          fontSize: 14,
          color: Constants.subTextColor,
        ),
        suffixIcon: GestureDetector(
          child: Icon(
            widget.isLoginPage
                ? Icons.lock
                : (isShow
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
            color: Colors.black87,
            size: 16,
          ),
          onTap: widget.isLoginPage
              ? null
              : () {
                  setState(() {
                    isShow = !isShow;
                  });
                },
        ),
        contentPadding: const EdgeInsets.only(left: 8),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: Constants.invalidColor,
          ),
        ),
      ),
    );
  }
}
