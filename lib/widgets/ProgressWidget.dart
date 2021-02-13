import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ProgressWidget extends StatelessWidget {

  final String progressText;
  
  ProgressWidget(this.progressText);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              PlatformCircularProgressIndicator(),
              SizedBox(width: 20,),
              Text(progressText, style: Theme.of(context).textTheme.subtitle1,)
            ],
          ),
        ),
      ),
    );
  }


}