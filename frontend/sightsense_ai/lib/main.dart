import 'package:flutter/material.dart';
import 'package:sightsense_ai/app.dart';

/// Application entry point for SightSense AI.
///
/// Initializes Flutter bindings and launches [SightSenseApp]. Feature logic
/// belongs in dedicated modules, not here.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SightSenseApp());
}
