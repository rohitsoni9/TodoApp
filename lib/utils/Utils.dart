export 'Extensions.dart';
import 'package:flutter/services.dart';

class ArchUtils {
  static void exitApp() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}
