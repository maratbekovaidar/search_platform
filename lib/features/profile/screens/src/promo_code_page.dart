import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PromoCodePage extends StatefulWidget {
  const PromoCodePage({Key? key}) : super(key: key);

  @override
  State<PromoCodePage> createState() => _PromoCodePageState();
}

class _PromoCodePageState extends State<PromoCodePage> {
  late TextEditingController _searchController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Активировать промокод"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// Logo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 96,
                  width: 96,
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)
                  ),
                  child: SvgPicture.asset(
                    Assets.icons.gift,
                    // ignore: deprecated_member_use
                    color: Colors.black,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 53),

            /// Search
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _searchController,
                    validator: (value) {
                      if(value == "") {
                        return "Введите промокод";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        label: Text("Промокод"),
                        prefixStyle: TextStyle(color: Colors.black)
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// Confirm button
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              _formKey.currentState!.validate();
                            },
                            child: const Text("Активировать промокод")
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
