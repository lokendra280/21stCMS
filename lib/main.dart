import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'main_common.dart';

void main() async {
  // setup();
  await mainCommon();

  runApp(
    ProviderScope(child: FasoWear()),
  );
}
