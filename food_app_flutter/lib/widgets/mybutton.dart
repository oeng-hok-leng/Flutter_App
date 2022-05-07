import 'package:flutter/material.dart';

import 'package:food_app_flutter/constants.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.isHaveBorder = false,
  }) : super(key: key);
  final Widget child;
  final bool isHaveBorder;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isHaveBorder ? Colors.white : Constants.orangeDarker,
          border: isHaveBorder
              ? Border.all(
                  color: Colors.black,
                  width: 1,
                )
              : null,
          borderRadius: BorderRadius.circular(6),
        ),
        child: child,
      ),
    );
  }
}
