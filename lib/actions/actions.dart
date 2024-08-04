import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

Future<String?> development(
  BuildContext context, {
  String? underDevelopment,
}) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text(
        'We are still on development',
        style: TextStyle(),
      ),
      duration: const Duration(milliseconds: 4000),
      backgroundColor: FlutterFlowTheme.of(context).secondary,
    ),
  );

  return null;
}
