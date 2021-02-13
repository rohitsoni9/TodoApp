import 'package:flutter/material.dart';
import 'package:todo_practical/constants/Constants.dart';

import 'RaisedButtonV2.dart';

enum Width { wrap, full }

class GradientButton extends StatelessWidget {
  final Icon icon;
  final Widget child;
  final Function onPressed;
  final double radius;
  final EdgeInsetsGeometry padding;
  final List<Color> colors;
  final Width width;
  final bool enabled;

  const GradientButton(
      {Key key,
      @required this.child,
      this.radius = 24,
      this.enabled = true,
      this.padding = const EdgeInsets.all(0),
      this.colors = const [
        ColorConstants.BUTTON_LIGHT,
        ColorConstants.BUTTON_DARK
      ],
      this.onPressed,
      this.width,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final childWidget = Container(
      width: width == Width.full ? double.infinity : null,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: enabled ? colors : [Colors.grey, Colors.grey],
          ),
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      padding: EdgeInsets.symmetric(
          horizontal: 36, vertical: (icon != null) ? 10 : 12),
      child: Row(
        mainAxisSize: width == Width.full ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: icon,
                )
              : Text(""),
          child
        ],
      ),
    );

    return RaisedButtonV2(
      onPressed: enabled ? onPressed : null,
      padding: padding,
      color: enabled ? colors[0] : Colors.grey,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: childWidget,
    );
  }
}
