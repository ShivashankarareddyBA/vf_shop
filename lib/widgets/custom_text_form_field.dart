import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final IconData? data;
  final String? hintText;
  final String? labelText;
  final EdgeInsetsGeometry? labelPadding;
  bool? isObscure;
  bool? enabled;
  bool? isScrolable;
  TextInputType? keyboardType;
  Decoration? decoration;

  CustomTextFormField({
    Key? key,
    this.controller,
    this.data,
    this.enabled,
    this.hintText,
    this.isObscure,
    this.isScrolable,
    this.labelText,
    this.keyboardType,
    this.labelPadding,
    this.decoration,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFormField createState() => _CustomTextFormField();
}

class _CustomTextFormField extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscure ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null)
            Text(
              widget.labelText!,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          TextFormField(
            enabled: widget.enabled,
            controller: widget.controller,
            obscureText: _obscureText,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              prefixIcon: Icon(
                widget.data,
                color: Colors.red,
              ),
              suffixIcon: widget.isObscure == true
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              focusColor: Theme.of(context).primaryColor,
              hintText: widget.hintText,
              contentPadding: widget.labelPadding,
            ),
          ),
        ],
      ),
    );
  }
}
