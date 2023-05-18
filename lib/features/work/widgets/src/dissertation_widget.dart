import 'package:dsplatform/features/work/domain/models/dissertation/dissertation_model.dart';
import 'package:dsplatform/features/work/screens/src/dissertation_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DissertationWidget extends StatefulWidget {
  const DissertationWidget({Key? key, required this.dissertationModel}) : super(key: key);

  final DissertationModel dissertationModel;

  @override
  State<DissertationWidget> createState() => _DissertationWidgetState();
}

class _DissertationWidgetState extends State<DissertationWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DissertationDetailPage(dissertationModel: widget.dissertationModel)));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.dissertationModel.organizationName,
              // "${widget.dissertationModel.users.first.firstName} ${widget.dissertationModel.users.first.surname}",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.8)
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.dissertationModel.name,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.black
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${widget.dissertationModel.category} • ${DateFormat("d MMMM, y").format(DateTime.now())}",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.5)
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
