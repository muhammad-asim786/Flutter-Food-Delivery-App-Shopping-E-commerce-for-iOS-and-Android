import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowMoreText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  const ShowMoreText({Key? key,required this.text,required this.fontSize,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text!,style: TextStyle(fontSize: fontSize!,color: Colors.black45),),
    );
  }
}
