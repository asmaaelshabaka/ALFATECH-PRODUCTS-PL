import 'package:flutter/material.dart';
import 'package:alfatech/view/widgets/custom_txt.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(this.text,this.hint,this.onSave,this.validator);
  final String text;
  final String hint;
  final Function (String?)? onSave;
  Function validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomTxt(text, Colors.grey.shade900, 14, 1,Alignment.topLeft),
          TextFormField(onSaved: onSave,
            validator: validator(),
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey)),
          )
        ],
      ),
    );
  }
}
