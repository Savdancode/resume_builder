import 'package:vibration/vibration.dart';

vibration({int? repeat, int? duration}) async {
  if (await Vibration.hasVibrator()) {
    Vibration.vibrate(duration: duration ?? 200, repeat: repeat ?? -1);
  }
}
