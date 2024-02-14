import 'package:flutter/material.dart';

import 'layers/presentation/app_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// https://github.com/flutter/flutter/pull/104828
  /// https://github.com/flutter/flutter/issues/104821#issuecomment-1139615118
  /// temporary fix (code smell): https://github.com/flutter/flutter/issues/99680#issuecomment-1071148878
  await Future.delayed(const Duration(milliseconds: 500));
  runApp(const AppRoot());
}
