import 'package:flutter/material.dart';
import 'package:alfatech/view/widgets/custom_txt.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';

class CustomButton extends StatelessWidget {
  CustomButton(this.text, this.onPressed);
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(width: 300,height: 50,
      // child: FlatButton(padding: EdgeInsets.all(20),
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(10)),
      //   onPressed: (){},
      //   color: Colors.red,
      //   child: CustomTxt(text, Colors.white, 10, Alignment.center),
      //  ),
      child: RoundedButton(
        title: text,
        onPressed: onPressed,
        textColor: Colors.white,
        buttonColor: Colors.red,


      ),
    );
  }
}
