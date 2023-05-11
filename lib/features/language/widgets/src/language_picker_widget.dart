import 'package:dsplatform/configurations/l10n/l10n.dart';
import 'package:dsplatform/configurations/language_provider/language_local_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LanguagePickerWidget extends StatefulWidget {
  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  State<LanguagePickerWidget> createState() => _LanguagePickerWidgetState();
}

class _LanguagePickerWidgetState extends State<LanguagePickerWidget> {

  final getIt = GetIt.I;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return DropdownButton<Locale>(
      value: locale,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      elevation: 16,
      underline: const SizedBox(),
      onChanged: (Locale? value) {
        getIt.get<LanguageLocalProvider>().setLocale(value!);
        setState(() {
        });
      },
      items: L10n.all.map<DropdownMenuItem<Locale>>((Locale value) {
        return DropdownMenuItem<Locale>(
          value: value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Flag
              Center(
                child: Text(
                  L10n.getFlag(value.languageCode),
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              // const SizedBox(width: 5),
              // /// Language
              // Text(
              //   AppLocalizations.of(context)!.language,
              //   style: const TextStyle(
              //     fontSize: 16,
              //   ),
              // )
            ],
          ),
        );
      }).toList(),
    );
  }
}
