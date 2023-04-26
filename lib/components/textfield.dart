import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldAuth extends StatelessWidget {
  final String? hintText;
  final Function? onTap;
  TextEditingController? controller = TextEditingController();
  TextInputType textInputType;
  String tipo;

  TextFieldAuth(
      {Key? key,
      this.hintText,
      this.onTap,
      this.controller,
      required this.textInputType,
      required this.tipo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadedScaleAnimation(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          style: const TextStyle(color: Colors.black),
          onTap: onTap as void Function()?,
          validator: (input) {
            if (textInputType == TextInputType.emailAddress) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              if (input!.isEmpty) {
                return "Inserte un email";
              } else {
                return regExp.hasMatch(input)
                    ? null
                    : "Inserte un email valido";
              }
            } else {
              if (input!.isEmpty) {
                return "Este campo es requerido";
              }
            }
          },
          obscureText: (tipo == "password") ? true : false,
          maxLines: (textInputType == TextInputType.multiline) ? 7 : 1,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black45, fontSize: 14),
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
