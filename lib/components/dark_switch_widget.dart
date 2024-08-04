import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'dark_switch_model.dart';
export 'dark_switch_model.dart';

class DarkSwitchWidget extends StatefulWidget {
  const DarkSwitchWidget({super.key});

  @override
  State<DarkSwitchWidget> createState() => _DarkSwitchWidgetState();
}

class _DarkSwitchWidgetState extends State<DarkSwitchWidget>
    with TickerProviderStateMixin {
  late DarkSwitchModel _model;

  var hasIconTriggered1 = false;
  var hasIconTriggered2 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DarkSwitchModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
    });

    animationsMap.addAll({
      'iconOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-32.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 1.08,
            end: 1.0,
          ),
        ],
      ),
      'iconOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(32.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.92,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (Theme.of(context).brightness == Brightness.light) {
          // makeDarkMode
          setDarkModeSetting(context, ThemeMode.dark);
          if (animationsMap['iconOnActionTriggerAnimation2'] != null) {
            setState(() => hasIconTriggered2 = true);
            SchedulerBinding.instance.addPostFrameCallback((_) async =>
                animationsMap['iconOnActionTriggerAnimation2']!
                    .controller
                    .forward(from: 0.0));
          }
        } else {
          // makeLightMode
          setDarkModeSetting(context, ThemeMode.light);
          if (animationsMap['iconOnActionTriggerAnimation1'] != null) {
            setState(() => hasIconTriggered1 = true);
            SchedulerBinding.instance.addPostFrameCallback((_) async =>
                animationsMap['iconOnActionTriggerAnimation1']!
                    .controller
                    .forward(from: 0.0)
                    .whenComplete(
                        animationsMap['iconOnActionTriggerAnimation1']!
                            .controller
                            .reverse));
          }
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: 48.0,
          height: 48.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 48.0,
              height: 48.0,
              child: Stack(
                alignment: const AlignmentDirectional(0.0, 0.0),
                children: [
                  if (Theme.of(context).brightness == Brightness.dark)
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.wb_sunny_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ).animateOnActionTrigger(
                            animationsMap['iconOnActionTriggerAnimation1']!,
                            hasBeenTriggered: hasIconTriggered1),
                      ),
                    ),
                  if (Theme.of(context).brightness == Brightness.light)
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.mode_night_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ).animateOnActionTrigger(
                            animationsMap['iconOnActionTriggerAnimation2']!,
                            hasBeenTriggered: hasIconTriggered2),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
