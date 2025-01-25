import 'package:flutter/material.dart';

class LabelTextfield extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isObscure;
  TextInputType? keyboardType;
  LabelTextfield({required this.label,required this.hintText,required this.controller,required this.isObscure,this.keyboardType ,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label,style: Theme.of(context).textTheme.labelLarge,),
        const SizedBox(height: 8,),
        TextField(
          controller: controller,
          obscureText: isObscure,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            hintText: hintText
          ),
        ),
        const SizedBox(height: 16,)
      ],
    );
  }
}