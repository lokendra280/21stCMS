import 'package:auto_route/auto_route.dart';
import 'package:cms/modules/Event/data/model/event_model.dart';
import 'package:cms/modules/Event/di/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/data/remote/network_exceptions.dart';
import '../../../core/presentation/resources/size_constants.dart';
import '../../../core/presentation/widget/empty_view.dart';

class EventPage extends ConsumerWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Event',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontFamily: GoogleFonts.inter().fontFamily,
                color: Colors.white,
              ),
        ),
        leading: InkWell(
          onTap: () {
            context.popRoute(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer(builder: (context, ref, child) {
              final state = ref.watch(eventInfoNotifier);
              return state.when(data: (data) {
                EventModel event = data;
                return _EventInfo(event);
              }, error: (error, stacktrace) {
                return EmptyView(
                  message: NetworkExceptions.getErrorMessage(
                      error as NetworkExceptions),
                );
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
            })
          ],
        ),
      ),
    );
  }
}

class _EventInfo extends StatelessWidget {
  final EventModel eventlist;

  const _EventInfo(
    this.eventlist, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: eventlist.data!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: SC.mW, vertical: SC.mH),
          child: Container(
            height: 60,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: SC.sH),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${eventlist.data![index].eventName}',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SBC.sH,
                  Expanded(
                    child: Text(
                      '${eventlist.data![index].description}',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontFamily: GoogleFonts.inter().fontFamily,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
