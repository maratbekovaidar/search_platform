import 'package:dsplatform/features/work/bloc/dissertation/dissertation_bloc.dart';
import 'package:dsplatform/features/work/domain/repositories/dissertation_repository.dart';
import 'package:dsplatform/features/work/widgets/src/dissertation_shimmer_widget.dart';
import 'package:dsplatform/features/work/widgets/src/dissertation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DissertationBloc(dissertationRepository: IDissertationRepository())..add(DissertationLoadFromBookmarksEvent()),
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light
          ),
          title: const Text(
              "Bookmark"
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocBuilder<DissertationBloc, DissertationState>(
          builder: (context, state) {
            if (state is DissertationLoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<DissertationBloc>(context).add(DissertationLoadFromBookmarksEvent());
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
        ),
      ),
    );
  }
}
