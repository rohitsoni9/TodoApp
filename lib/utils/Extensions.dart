import 'package:intl/intl.dart';

extension StringExtensions on String {
  bool get isEmptyOrNull {
    return this == null || (this != null && this.isEmpty);
  }
}

extension DateTimeExtensions on DateTime {
  String get ddMMMyyyy {
    return DateFormat("dd MMM yyyy").format(this);
  }

  String get ddMMMyyyyhhmmssaa {
    return DateFormat("dd MMM yyyy hh:mm:ss aa").format(this);
  }

  String get ddMMMyyyyhhmmaa {
    return DateFormat("dd MMM yyyy hh:mm aa").format(this);
  }

  String get hhmmssaa {
    return DateFormat("hh:mm:ss aa").format(this);
  }

  String get hhmmaa {
    return DateFormat("hh:mm aa").format(this);
  }
}

extension DurationExtensions on Duration {
  String get hms {
    if (inMicroseconds < 0) {
      return "-${-this}";
    }
    String twoDigitMinutes =
        _twoDigits(inMinutes.remainder(Duration.minutesPerHour) as int);
    String twoDigitSeconds =
        _twoDigits(inSeconds.remainder(Duration.secondsPerMinute) as int);
    return "${inHours}h ${twoDigitMinutes}m ${twoDigitSeconds}s";
  }

  String get hm {
    if (inMicroseconds < 0) {
      return "-${-this}";
    }
    String twoDigitMinutes =
        _twoDigits(inMinutes.remainder(Duration.minutesPerHour) as int);
    return "${inHours}h ${twoDigitMinutes}m";
  }

  String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}
