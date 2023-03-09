import 'package:cms/core/presentation/resources/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notices',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontFamily: GoogleFonts.inter().fontFamily,
              ),
        ),
        leading: const Icon(
          Icons.arrow_back,
          size: 20,
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: SC.lH, vertical: SC.mW),
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: SC.mW),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.outer,
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.notifications_active,
                      size: 18,
                    ),
                    Text(
                      'Message From CEO',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontFamily: GoogleFonts.inter().fontFamily,
                          ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
