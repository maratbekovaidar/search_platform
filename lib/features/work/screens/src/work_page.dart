import 'package:dsplatform/components/notification_widget/notification_widget.dart';
import 'package:dsplatform/features/work/bloc/dissertation/dissertation_bloc.dart';
import 'package:dsplatform/features/work/widgets/src/dissertation_shimmer_widget.dart';
import 'package:dsplatform/features/work/widgets/src/dissertation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<DissertationBloc, DissertationState>(
      listener: (context, state) {
        if(state is DissertationFailureState) {
          showErrorNotificationWidget(context);
        }
      },
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light
            ),
            title: const Text("Работы"),
            elevation: 0.1,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  isScrollable: true,
                  tabs: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Tab(
                        text: "For you",
                      ),
                    ),
                    Tab(
                      text: "Computer science",
                    ),
                  ],
                ),
              ),
            ),
            ),

          body: BlocBuilder<DissertationBloc, DissertationState>(
            builder: (context, state) {
              if (state is DissertationLoadedState) {
                return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<DissertationBloc>(context).add(DissertationLoadEvent());
                  },
                  child: ListView.builder(
                    itemCount: state.dissertations.length,
                    itemBuilder: (context, index) {
                      return DissertationWidget(dissertationModel: state.dissertations[index]);
                    }
                  ),
                );
              }
              return const Column(
                children: [
                  DissertationShimmerWidget(),
                  DissertationShimmerWidget(),
                  DissertationShimmerWidget(),
                  DissertationShimmerWidget(),
                  DissertationShimmerWidget(),
                ],
              );
            },
          )
        ),
      ),
    );
  }
}
