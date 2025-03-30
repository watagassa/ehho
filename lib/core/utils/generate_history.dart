String generateImagePath(int value) {
  switch (value) {
    case 0:
      return "assets/images/ehho_running.png";
    case 1:
      return "assets/images/ehho_walking.png";
    case 2:
      return "assets/images/ehho_cycling.png";
    default:
      return "no search file";
  }
}

String formatDuration(int seconds) {
  Duration duration = Duration(seconds: seconds);
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  String hours = twoDigits(duration.inHours);
  String minutes = twoDigits(duration.inMinutes.remainder(60));
  String secs = twoDigits(duration.inSeconds.remainder(60));

  return '$hours:$minutes:$secs';
}
