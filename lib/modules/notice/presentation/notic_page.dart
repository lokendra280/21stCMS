import 'package:cms/modules/notice/data/model/notice_model.dart';
import 'package:cms/modules/notice/presentation/notifier/notice_notifer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/presentation/resources/size_constants.dart';

class NoticePage extends ConsumerWidget {
  const NoticePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notice = <NoticeModel>[];
    var isLoading = false;
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
        itemCount: notice.length + (isLoading ? 1 : 0),
        itemBuilder: ((context, index) {
          if (index < notice.length) {
            final notices = notice[index];
          }
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: SC.lH, vertical: SC.mW),
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
                    '${notice.first.data![index].heading}',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                  ),
                  Text(
                    '${notice.first.data![index].description}',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
