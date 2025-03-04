import 'package:bot_toast/bot_toast.dart';
import 'package:resume_maker/util/utils.dart';
import 'package:resume_maker/widget/alert/snack_bar_widget.dart';

enum SnackBarStatus {
  success,
  error,
}

Future<void> alertSnackbar({
  required String message,
  String title = '',
  SnackBarStatus snackbar = SnackBarStatus.error,
  int milliseconds = 3000,
}) async {
  // var content = ;
  if (snackbar == SnackBarStatus.error) {
    vibration();
  }
  BotToast.showCustomNotification(
    toastBuilder: (cancelFunc) {
      return SnackbarWidget(
        title: title,
        message: message,
        snackbar: snackbar,
        cancel: cancelFunc,
      );
    },
    duration: Duration(milliseconds: milliseconds),
  );
}
