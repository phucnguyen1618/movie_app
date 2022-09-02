import 'package:flutter/material.dart';

import 'app.dart';
import 'base/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  runApp(const App());
}
