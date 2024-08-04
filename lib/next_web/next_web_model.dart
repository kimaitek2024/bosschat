import '/flutter_flow/flutter_flow_util.dart';
import 'next_web_widget.dart' show NextWebWidget;
import 'package:flutter/material.dart';

class NextWebModel extends FlutterFlowModel<NextWebWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
