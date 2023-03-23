import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/assertions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'main_common.dart';

void main() async {
  // setup();
  WidgetsFlutterBinding.ensureInitialized();

  await mainCommon();

  runApp(
    ProviderScope(child: Application()),
  );
}
