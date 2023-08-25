import 'package:flutter/material.dart';

class KustomButton extends StatelessWidget {
  const KustomButton(
      {Key? key,
      required this.color,
      required this.text,
      this.width,
      this.height = 45,
      required this.onPressed,
      this.margin = EdgeInsets.zero,
      this.borderdecoration = false,
      this.bordercolor = Colors.grey,
      this.buttondecoration,
      this.textpadding,
      this.circularborder})
      : super(key: key);
  final double? width;
  final double? height;
  final double? circularborder;
  final Color color;
  final Color bordercolor;
  final Widget text;
  final bool borderdecoration;
  final ShapeBorder? buttondecoration;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry? textpadding;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: borderdecoration
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(
                circularborder ?? 10,
              ),
              border: Border.all(
                width: 2,
                color: bordercolor,
              ),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(
                circularborder ?? 10,
              ),
            ),
      child: MaterialButton(
        shape: buttondecoration ??
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              circularborder ?? 25,
            )),
        elevation: 2,
        onPressed: onPressed,
        padding: textpadding,
        minWidth: 0,
        color: color,
        child: text,
      ),
    );
  }
}
