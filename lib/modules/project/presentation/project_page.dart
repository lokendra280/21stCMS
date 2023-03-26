import 'package:auto_route/auto_route.dart';
import 'package:cms/core/data/remote/network_exceptions.dart';
import 'package:cms/core/presentation/widget/base_widget.dart';
import 'package:cms/core/presentation/widget/empty_view.dart';
import 'package:cms/modules/project/data/models/project_model.dart';
import 'package:cms/modules/project/presentation/notifier/project_info_notfier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/presentation/resources/size_constants.dart';
import '../di/injection.dart';

class ProjectPage extends ConsumerWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Projects',
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
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Consumer(builder: (context, ref, child) {
              final state = ref.watch(projectInfoNotifier);
              return state.when(data: (data) {
                ProjectModel project = data;
                return _ProjectDetailInfo(project);
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

class _ProjectDetailInfo extends StatelessWidget {
  final ProjectModel projectlist;
  const _ProjectDetailInfo(
    this.projectlist, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final params = projectlist.data;
    return BaseWidget(builder: (context, config, themeData) {
      return ListView.builder(
        itemCount: params?.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: SC.mW, vertical: SC.mH),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.20,
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
                    config.verticalSpaceSmall(),
                    Text(
                      'Project Name :-   ' '${params![index].ProjectModelName}',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SBC.sH,
                    Text(
                      'Start Date  :-   ' '${params[index].startDate}',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SBC.sH,
                    Text(
                      'End Date  :-     ' '${params[index].deadline}',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SBC.sH,
                    Expanded(
                      child: Text(
                        'Project Summary :-   '
                        '${params[index].ProjectModelSummary}',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontWeight: FontWeight.bold,
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
    });
  }
}
