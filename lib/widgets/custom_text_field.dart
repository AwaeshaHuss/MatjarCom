import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  String? hint;
  TextStyle? hintStyle;
  IconData? icon;
  Color? iconColor, borderColor, fillColor;
  EdgeInsetsGeometry? spaces;
  bool? isFilled, isTextSecured;
  int? maxLength;
  TextInputType? inputType;

  CustomTextField(
      {this.controller,
      this.hint,
      this.hintStyle,
      this.icon,
      this.iconColor,
      this.borderColor,
      this.fillColor,
      this.spaces,
      this.maxLength,
      this.inputType,
      this.isTextSecured,
      this.isFilled});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: spaces ?? EdgeInsets.zero,
      margin: spaces ?? EdgeInsets.zero,
      child: TextField(
          obscureText: isTextSecured ?? false,
          controller: controller,
          maxLines: 1,
          maxLength: maxLength,
          cursorColor: Colors.grey,
          cursorWidth: 4,
          keyboardType: inputType,
          decoration: InputDecoration(
            counter: Text(
              '${controller?.text.length}/${maxLength ?? 0}',
              style: const TextStyle(color: Colors.grey),
            ),
            filled: isFilled,
            fillColor: fillColor,
            hintText: hint,
            hintStyle: hintStyle,
            prefixIcon: Icon(
              icon,
              color: iconColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: borderColor ?? Colors.white,
                width: 4.0,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: borderColor ?? Colors.blue,
                width: 4.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: borderColor ?? Colors.blue,
                width: 4.0,
              ),
            ),
          )),
    );
  }
}
