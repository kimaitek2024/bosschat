import '/backend/backend.dart';
import '/components/conversation_card_widget.dart';
import '/components/dark_switch_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'personality_widget.dart' show PersonalityWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PersonalityModel extends FlutterFlowModel<PersonalityWidget> {
  ///  Local state fields for this page.

  DocumentReference? activeChat;

  bool hasActiveChat = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ConversationsRecord? newConversations;
  // Models for conversationCard dynamic component.
  late FlutterFlowDynamicModels<ConversationCardModel> conversationCardModels;
  // Model for darkSwitch component.
  late DarkSwitchModel darkSwitchModel;
  AudioPlayer? soundPlayer;

  /// Query cache managers for this widget.

  final _conversationsManager =
      StreamRequestManager<List<ConversationsRecord>>();
  Stream<List<ConversationsRecord>> conversations({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ConversationsRecord>> Function() requestFn,
  }) =>
      _conversationsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearConversationsCache() => _conversationsManager.clear();
  void clearConversationsCacheKey(String? uniqueKey) =>
      _conversationsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    conversationCardModels =
        FlutterFlowDynamicModels(() => ConversationCardModel());
    darkSwitchModel = createModel(context, () => DarkSwitchModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    conversationCardModels.dispose();
    darkSwitchModel.dispose();

    /// Dispose query cache managers for this widget.

    clearConversationsCache();
  }
}
