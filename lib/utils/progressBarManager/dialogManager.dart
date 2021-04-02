import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/utils/progressBarManager/dialogService.dart';

import '../locator.dart';
import 'dialogModels.dart';


class ProgressManager extends StatefulWidget {
  final Widget child;
  ProgressManager({Key key, this.child}) : super(key: key);

  _ProgressManagerState createState() => _ProgressManagerState();
}

class _ProgressManagerState extends State<ProgressManager> {
  ProgressService _progressService = locator<ProgressService>();

  @override
  void initState() {
    super.initState();
    _progressService.registerProgressListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(ProgressRequest request) {
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        dismissable: false,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));

    // pr.show();
    progressDialog.show(); // show dialog
    //progressDialog.dismiss();
    print('show');

  }

}
