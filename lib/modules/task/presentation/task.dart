import 'package:cms/core/data/remote/network_exceptions.dart';
import 'package:cms/core/presentation/widget/empty_view.dart';
import 'package:cms/modules/task/data/model/task_model.dart';
import 'package:cms/modules/task/di/injection.dart';
import 'package:cms/modules/task/presentation/notifier/task_info_notfier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/presentation/resources/size_constants.dart';
import '../../../core/presentation/widget/base_widget.dart';
import '../../../core/presentation/widget/shimmer_effect.dart';

class TaskPage extends ConsumerWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Task',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontFamily: GoogleFonts.inter().fontFamily,
                color: Colors.white,
              ),
        ),
        leading: const Icon(
          Icons.arrow_back,
          size: 20,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Consumer(builder: (context, ref, child) {
              final state = ref.watch(taskInfoNotifier);
              return state.when(data: (data) {
                TaskModel taskModel = data;

                return _TaskDetail(taskModel);
              }, error: (error, stacktrace) {
                return EmptyView(
                  message: NetworkExceptions.getErrorMessage(
                      error as NetworkExceptions),
                );
              }, loading: () {
                return const Center(child: CircularProgressIndicator());
              });
            })
          ],
        ),
      ),
    );
  }
}

class _TaskDetail extends StatelessWidget {
  const _TaskDetail(
    this.taskModel, {
    Key? key,
  }) : super(key: key);
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: taskModel.data!.length,
        itemBuilder: (context, index) {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${taskModel.data![index].heading}",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                  ),
                  Text(
                    "${taskModel.data![index].description}",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                  ),
                  Text(
                    "${taskModel.data![index].startDate}",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                  ),
                  Text(
                    "${taskModel.data![index].dueDate}",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                  ),
                  Text(
                    "${taskModel.data![index].status}",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
