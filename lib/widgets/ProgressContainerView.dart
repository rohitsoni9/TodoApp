import 'package:flutter/material.dart';

import 'ProgressWidget.dart';

class ProgressContainerView extends StatelessWidget {
  final Widget child;
  final Widget progressWidget;
  final bool isProgressRunning;
  final String progressText;
  final double progressWidgetOpacity;

  ProgressContainerView(
      {@required this.child,
      @required this.isProgressRunning,
      this.progressText = "Please Wait",
      this.progressWidgetOpacity = 0.6,
      this.progressWidget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Visibility(
            visible: isProgressRunning,
            child: Container(
                color: Colors.grey.withOpacity(progressWidgetOpacity ?? 0.6),
                child: progressWidget ?? ProgressWidget(this.progressText))),
      ],
    );
    // return isProgressRunning ? ProgressWidget(this.progressText) : child;
  }
}
