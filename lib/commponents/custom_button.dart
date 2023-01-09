import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final bool min;
  final bool iswhite;
  final Function() press;

  const CustomButton(
      {required this.text, this.min = false,this.iswhite = false, super.key, required this.press});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.min ? 45 : 50,
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
       
        gradient: LinearGradient(
          begin: Alignment(1.0, 0.0),
          end: Alignment(1.0, 2.5),
          stops: [0.0, 1.0],
          colors: [
            maincolor,
            Color.fromARGB(231, 32, 27, 39),
          ],
        ),
      ),
      child: ElevatedButton(
          onPressed: widget.press,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              minimumSize: widget.min ? Size(140, 45) : Size(200, 50),
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          child: Text(
            widget.text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )),
    );
  }
}
