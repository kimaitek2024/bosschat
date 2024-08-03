import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/gemini/gemini.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'chat_thread_model.dart';
export 'chat_thread_model.dart';

class ChatThreadWidget extends StatefulWidget {
  const ChatThreadWidget({super.key});

  @override
  State<ChatThreadWidget> createState() => _ChatThreadWidgetState();
}

class _ChatThreadWidgetState extends State<ChatThreadWidget> {
  late ChatThreadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatThreadModel());

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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 56.0, 16.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).accent1,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
              ],
            ),
          ),
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).alternate,
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                final messages = _model.conversation.toList();
                if (messages.isEmpty) {
                  return const EmptyListWidget();
                }

                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    0,
                    0,
                    12.0,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: messages.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 0.0),
                  itemBuilder: (context, messagesIndex) {
                    final messagesItem = messages[messagesIndex];
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            if (!messagesItem.userSent) {
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.auto_awesome_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Gemini Ai',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                            dateTimeFormat('relative',
                                                messagesItem.timeCreated!),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(width: 12.0)),
                                      ),
                                      Text(
                                        messagesItem.text,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  valueOrDefault<String>(
                                                    currentUserDisplayName,
                                                    'A',
                                                  ).maybeHandleOverflow(
                                                      maxChars: 1),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Figtree',
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                            dateTimeFormat('relative',
                                                messagesItem.timeCreated!),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(width: 12.0)),
                                      ),
                                      Text(
                                        messagesItem.text,
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
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Stack(
                alignment: const AlignmentDirectional(1.0, 1.0),
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Enter prompt here...',
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                        alignLabelWithHint: true,
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Figtree',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: (_model.textFieldFocusNode?.hasFocus ??
                                false)
                            ? FlutterFlowTheme.of(context).accent1
                            : FlutterFlowTheme.of(context).primaryBackground,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 100.0, 16.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Instrument Sans',
                            letterSpacing: 0.0,
                          ),
                      maxLines: 8,
                      minLines: 2,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 12.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          // updatePrompt
                          _model.addToConversation(MessageStruct(
                            text: _model.textController.text,
                            userSent: true,
                            timeCreated: getCurrentTimestamp,
                            type: 'prompt',
                          ));
                          setState(() {});
                          unawaited(
                            () async {
                              await _model.listViewController?.animateTo(
                                _model.listViewController!.position
                                    .maxScrollExtent,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.ease,
                              );
                            }(),
                          );
                          setState(() {
                            _model.textController?.clear();
                          });
                          await geminiGenerateText(
                            context,
                            _model.textController.text,
                          ).then((generatedText) {
                            safeSetState(
                                () => _model.createdText = generatedText);
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

                          setState(() {});
                        },
                        text: 'Send',
                        options: FFButtonOptions(
                          height: 36.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Instrument Sans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
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
  }
}
