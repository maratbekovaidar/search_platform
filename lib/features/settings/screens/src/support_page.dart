import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {

  late TextEditingController _messageController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }
  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Написать в поддержку"),
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [

          /// Logo
          Row(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                height: 96,
                width: 96,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24)
                ),
                child: SvgPicture.asset(Assets.icons.askMessage),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Form(
            key: _formKey,
            child: Column(
              children: [
                /// Text area
                TextFormField(
                  controller: _messageController,
                  maxLength: 500,
                  maxLines: 5,
                  onChanged: (value) {
                    setState(() {

                    });
                  },
                  validator: (value) {
                    if(value == "") {
                      return "Введите текст сообщение";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "Текст сообшение",
                    counterText: "${_messageController.text.length}/500"
                  ),

                ),
                const SizedBox(height: 16),

                /// Send button
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.validate();
                        },
                        child: const Text("Отправить сообщение"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
