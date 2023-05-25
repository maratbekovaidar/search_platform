import 'package:dsplatform/features/work/bloc/dissertation/dissertation_bloc.dart';
import 'package:dsplatform/features/work/domain/repositories/dissertation_repository.dart';
import 'package:dsplatform/features/work/widgets/src/dissertation_shimmer_widget.dart';
import 'package:dsplatform/features/work/widgets/src/dissertation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final DissertationBloc _dissertationBloc = DissertationBloc(dissertationRepository: IDissertationRepository());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _dissertationBloc..add(DissertationLoadEvent()),
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light
          ),
          title: const Text(
            "Search",
          ),
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 150),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      _dissertationBloc.add(DissertationLoadEvent(filter: value));
                    },
                    decoration: const InputDecoration(
                      hintText: "Search dissertation",
                      suffixIcon: Icon(
                        Icons.search
                      )
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(onTap: () {
                          _dissertationBloc.add(DissertationLoadEvent(filter: "Software Engineering"));
                        }, child: const Chip(label: Text("All"))),
                        const SizedBox(width: 8),
                        GestureDetector(onTap: () {
                          _dissertationBloc.add(DissertationLoadEvent(filter: "Software Engineering"));
                        }, child: const Chip(label: Text("Software Engineering"))),
                        const SizedBox(width: 8),
                        GestureDetector(onTap: () {
                          _dissertationBloc.add(DissertationLoadEvent(filter: "Network"));
                        }, child: const Chip(label: Text("Network"))),
                        const SizedBox(width: 8),
                        GestureDetector(onTap: () {
                          _dissertationBloc.add(DissertationLoadEvent(filter: "Data Science"));
                        }, child: const Chip(label: Text("Data Science"))),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
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
            return ListView(
              children: const [
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
