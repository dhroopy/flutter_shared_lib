

import 'package:shared_libs/core/dialog/snackbar.dart';

abstract class AppDialog {
  void showAppDialog({String? title, String? body});
}

class SnackBarDialog extends AppDialog {
  SnackBarDialog();

  @override
  void showAppDialog({title, body}) {
    snackbar(title: title.toString(), message: body.toString());
  }
}
