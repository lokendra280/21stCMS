/// Author:    Lokendra Gharti
/// Created:   19.12.2022
/// Description:
/// (c) Copyright by lokendragharti3@gmail.com.
///*/
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'main_common.dart';

Future<void> main() async {
  await mainCommon();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(DevicePreview(
    enabled: true,
    builder: (context) => ProviderScope(child: Application()),
  ));
}
