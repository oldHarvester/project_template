extension IntExtension on int {
  int get secToMilliSec {
    return this * 1000;
  }

  double get milliSecToSec {
    return this / 1000;
  }
}