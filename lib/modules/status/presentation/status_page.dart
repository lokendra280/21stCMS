import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Status',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontFamily: GoogleFonts.inter().fontFamily,
              ),
        ),
      ),
    );
  }
}
