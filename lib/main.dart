/// Author:    Lokendra Gharti
/// Created:   26.12.2022
/// Description:
/// (c) Copyright by 21st tech pvt ltd.
///*/
import 'package:cms/modules/dashboard/dashboard.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  // await mainCommon();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Test",
      home: DashBoardScreen(),
    );
  }
}
