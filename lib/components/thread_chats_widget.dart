import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/gemini/gemini.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'thread_chats_model.dart';
export 'thread_chats_model.dart';

class ThreadChatsWidget extends StatefulWidget {
  const ThreadChatsWidget({
    super.key,
    required this.conversationRef,
  });

  final DocumentReference? conversationRef;

  @override
  State<ThreadChatsWidget> createState() => _ThreadChatsWidgetState();
}

class _ThreadChatsWidgetState extends State<ThreadChatsWidget> {
  late ThreadChatsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThreadChatsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.textController?.clear();
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConversationsRecord>(
      stream: ConversationsRecord.getDocument(widget.conversationRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }

        final cardCommentConversationsRecord = snapshot.data!;

        return Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 700.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    final chatMessages =
                        cardCommentConversationsRecord.conversation.toList();

                    return ListView.separated(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        0,
                        0,
                        24.0,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: chatMessages.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 0.0),
                      itemBuilder: (context, chatMessagesIndex) {
                        final chatMessagesItem =
                            chatMessages[chatMessagesIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                if (!chatMessagesItem.userSent) {
                                  return Container(
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 8.0, 12.0, 8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 36.0,
                                                height: 36.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.auto_awesome_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Gemini Ai',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Instrument Sans',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                dateTimeFormat(
                                                    'relative',
                                                    chatMessagesItem
                                                        .timeCreated!),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(width: 12.0)),
                                          ),
                                          Text(
                                            chatMessagesItem.text,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Instrument Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 8.0, 12.0, 8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 36.0,
                                                height: 36.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      valueOrDefault<String>(
                                                        currentUserDisplayName,
                                                        'A',
                                                      ).maybeHandleOverflow(
                                                          maxChars: 1),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily:
                                                                'Figtree',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    currentUserDisplayName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Instrument Sans',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                dateTimeFormat(
                                                    'relative',
                                                    chatMessagesItem
                                                        .timeCreated!),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(width: 12.0)),
                                          ),
                                          Text(
                                            chatMessagesItem.text,
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        );
                      },
                      controller: _model.listViewController,
                    );
                  },
                ),
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 36.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Stack(
                    alignment: const AlignmentDirectional(1.0, 1.0),
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Enter prompt here...',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                            alignLabelWithHint: false,
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            filled: true,
                            fillColor:
                                (_model.textFieldFocusNode?.hasFocus ?? false)
                                    ? FlutterFlowTheme.of(context).accent1
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 90.0, 16.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Instrument Sans',
                                    letterSpacing: 0.0,
                                  ),
                          maxLines: 8,
                          minLines: 2,
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 8.0, 8.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final firestoreBatch =
                                  FirebaseFirestore.instance.batch();
                              try {
                                // myMessage

                                firestoreBatch.update(
                                    cardCommentConversationsRecord.reference, {
                                  ...mapToFirestore(
                                    {
                                      'conversation': FieldValue.arrayUnion([
                                        getMessageFirestoreData(
                                          updateMessageStruct(
                                            MessageStruct(
                                              text: _model.textController.text,
                                              userSent: true,
                                              timeCreated: getCurrentTimestamp,
                                              type: 'prompt',
                                            ),
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    },
                                  ),
                                });
                                unawaited(
                                  () async {
                                    await _model.listViewController?.animateTo(
                                      _model.listViewController!.position
                                          .maxScrollExtent,
                                      duration: const Duration(milliseconds: 200),
                                      curve: Curves.ease,
                                    );
                                  }(),
                                );
                                setState(() {
                                  _model.textController?.clear();
                                });
                                await geminiGenerateText(
                                  context,
                                  'Please answer in 100 words or less, i\'m inquiring about the following information: ${functions.getListOfMessages(cardCommentConversationsRecord.conversation.toList())}',
                                ).then((generatedText) {
                                  safeSetState(
                                      () => _model.createdText = generatedText);
                                });

                                // geminiResponse

                                firestoreBatch.update(
                                    cardCommentConversationsRecord.reference, {
                                  ...mapToFirestore(
                                    {
                                      'conversation': FieldValue.arrayUnion([
                                        getMessageFirestoreData(
                                          updateMessageStruct(
                                            MessageStruct(
                                              text: _model.createdText,
                                              userSent: false,
                                              timeCreated: getCurrentTimestamp,
                                              type: 'prompt',
                                            ),
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    },
                                  ),
                                });
                                // showResponse
                                _model.addToConversation(MessageStruct(
                                  text: _model.createdText,
                                  userSent: false,
                                  timeCreated: getCurrentTimestamp,
                                  type: 'response',
                                ));
                                setState(() {});
                                await Future.delayed(
                                    const Duration(milliseconds: 1000));
                                unawaited(
                                  () async {
                                    await _model.listViewController?.animateTo(
                                      _model.listViewController!.position
                                          .maxScrollExtent,
                                      duration: const Duration(milliseconds: 200),
                                      curve: Curves.ease,
                                    );
                                  }(),
                                );
                              } finally {
                                await firestoreBatch.commit();
                              }

                              setState(() {});
                            },
                            text: 'Send',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Instrument Sans',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(44.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ].divide(const SizedBox(height: 0.0)),
          ),
        );
      },
    );
  }
}
