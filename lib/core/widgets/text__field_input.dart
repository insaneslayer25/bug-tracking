import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;

  const TextFieldInput({
    super.key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
        // width: 4,
      ),
      borderRadius: BorderRadius.circular(20),
    );
    return TextField(
      controller: textEditingController,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 15,
          fontFamily: 'Mooli',
        ),
        border: border,
        contentPadding: const EdgeInsets.all(20),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
