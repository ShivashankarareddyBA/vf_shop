import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? data;
  final String? hintText;
  final String? labelText;
  final EdgeInsetsGeometry? labelPadding;
  bool? isObsecure;
  bool? isScrolabel;
  TextInputType? keyboardType;

  CustomTextFormField({
    Key? key,
    this.controller,
    this.data,
    this.hintText,
    this.isObsecure,
    this.isScrolabel,
    this.labelPadding,
    this.labelText,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
