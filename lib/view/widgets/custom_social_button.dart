import 'package:flutter/material.dart';
import 'package:alfatech/view/widgets/custom_txt.dart';

class CustomSocialButton extends StatelessWidget {
  CustomSocialButton(this.ImagePath,this.txt,this.onPressed);
  final String txt;
  final String ImagePath;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return     Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.grey.shade100),
      child: TextButton(
         // RoundedRectangleBorder(
            //  borderRadius: BorderRadius.circular(10)),
          onPressed: (){onPressed();},
          child: Row(
            children: [
              Image.asset(
                ImagePath,
                height: 25,
                width: 25,
              ),SizedBox(width: 50,),
              CustomTxt(txt, Colors.black, 12,1,
                  Alignment.center)
            ],
          )),
    );
  }
}
