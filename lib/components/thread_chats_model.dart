import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'thread_chats_widget.dart' show ThreadChatsWidget;
import 'package:flutter/material.dart';

class ThreadChatsModel extends FlutterFlowModel<ThreadChatsWidget> {
  ///  Local state fields for this component.

  List<MessageStruct> conversation = [];
  void addToConversation(MessageStruct item) => conversation.add(item);
  void removeFromConversation(MessageStruct item) => conversation.remove(item);
  void removeAtIndexFromConversation(int index) => conversation.removeAt(index);
  void insertAtIndexInConversation(int index, MessageStruct item) =>
      conversation.insert(index, item);
  void updateConversationAtIndex(int index, Function(MessageStruct) updateFn) =>
      conversation[index] = updateFn(conversation[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? createdText;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
