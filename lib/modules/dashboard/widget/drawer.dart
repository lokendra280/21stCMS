import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[700],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'admin',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
              ),
              Text(
                'admin@gmail.com',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
