import 'package:dsplatform/app.dart';
import 'package:dsplatform/components/notification_widget/notification_widget.dart';
import 'package:dsplatform/features/work/bloc/dissertation/dissertation_bloc.dart';
import 'package:dsplatform/features/work/domain/models/dissertation/dissertation_model.dart';
import 'package:dsplatform/features/work/domain/repositories/dissertation_repository.dart';
import 'package:dsplatform/features/work/domain/services/dissertation_service.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:dsplatform/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class DissertationDetailPage extends StatefulWidget {
  const DissertationDetailPage({Key? key, required this.dissertationModel}) : super(key: key);
  final DissertationModel dissertationModel;
  @override
  State<DissertationDetailPage> createState() => _DissertationDetailPageState();
}

class _DissertationDetailPageState extends State<DissertationDetailPage> {
  final DissertationBloc _dissertationBloc = DissertationBloc(dissertationRepository: IDissertationRepository());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _dissertationBloc,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.1,
            actions: [
              IconButton(onPressed: () {
                _dissertationBloc.add(DissertationSaveEvent(widget.dissertationModel));
                showNotificationWidget(context, "Dissertation added to Bookmarks", NotificationWidgetType.success);
              }, icon: Icon(Icons.bookmark_add_outlined, color: Colors.black.withOpacity(0.8),)),
              IconButton(onPressed: () {}, icon: Icon(Icons.share, color: Colors.black.withOpacity(0.8),)),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz_rounded, color: Colors.black.withOpacity(0.8),))
            ],
          ),
          backgroundColor: Colors.white,
          body: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Org
                  Text(
                    widget.dissertationModel.organizationName,
                    // "${widget.dissertationModel.users.first.firstName} ${widget.dissertationModel.users.first.surname}",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.8)
                    ),
                  ),
                  const SizedBox(height: 8),
                  /// Title
                  Text(
                    widget.dissertationModel.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// Publisher
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black.withOpacity(0.1),
                        child: SvgPicture.asset(Assets.icons.profile, width: 15,),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Aidar Maratbekov",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  /// Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.dissertationModel.category} • ${DateFormat("d MMMM, y").format(DateTime.now())}",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.5)
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  SizedBox(
                    width: MediaQuery.of(context).size.width - 48,
                    child: const Text(
                      "Abstract",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: "Times New Roman",
                        height: 1.5
                      ),
                    ),
                  ),

                  /// Abstract
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 48,
                    child: Text(
                      widget.dissertationModel.dissertAbstract,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Times New Roman",
                        height: 1.5
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  SizedBox(
                    width: MediaQuery.of(context).size.width - 48,
                    child: const Text(
                      "Files:",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: "Times New Roman",
                          height: 1.5
                      ),
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.dissertationModel.files.map((e) {
                      return TextButton(
                        onPressed: () {
                          DissertationService().downloadFile(e.name);
                        },
                        child: Text(
                          e.name,
                          style: const TextStyle(
                            decoration: TextDecoration.underline
                          ),
                        ),
                      );
                    }).toList()
                  )


                ],
              )
            ],
          ),
        ),
    );
  }
}
