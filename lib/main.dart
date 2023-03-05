/// Author:    Lokendra Gharti
/// Created:   26.12.2022
/// Description:
/// (c) Copyright by 21st tech pvt ltd.
///*/
import 'package:cms/modules/dashboard/dashboard.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  // await mainCommon();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test",
      home: DashBoardPage(),
    );
  }
}
