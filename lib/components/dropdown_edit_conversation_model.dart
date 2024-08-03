import '/flutter_flow/flutter_flow_util.dart';
import 'dropdown_edit_conversation_widget.dart'
    show DropdownEditConversationWidget;
import 'package:flutter/material.dart';

class DropdownEditConversationModel
    extends FlutterFlowModel<DropdownEditConversationWidget> {
  ///  Local state fields for this component.

  bool showRename = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
