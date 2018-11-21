import 'package:flutter/material.dart';

class TextFormFieldBox extends StatelessWidget {
  const TextFormFieldBox({
    Key key,
    this.controller,
    this.validator,
    this.labelText,
    this.ObscureText = false,
    this.MaxLength = null,
    this.DisplayCounter = false,
  });

  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final String labelText;
  final bool ObscureText;
  final int MaxLength;
  final bool DisplayCounter;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: controller,
        obscureText: ObscureText,
        maxLength: MaxLength,
        validator: validator,
        decoration: InputDecoration(
          hintText: labelText,
          counterStyle: TextStyle(
            color: DisplayCounter ?  Colors.black : Colors.transparent
          ),
          errorStyle: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  static String Required(String value) {
    if (value.isEmpty) {
      return 'this field is required';
    }
  }
}
