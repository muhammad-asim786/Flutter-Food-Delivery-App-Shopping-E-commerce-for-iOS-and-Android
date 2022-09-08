import 'package:delivery_app/Widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IconsAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final double? size;
  final Color iconsColor;
  const IconsAndText(
      {Key? key,
      required this.text,
      required this.icon,
      this.size,
      required this.iconsColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconsColor,
          size: size,
        ),
        SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
          size: 20,
        ),
      ],
    );
  }
}
