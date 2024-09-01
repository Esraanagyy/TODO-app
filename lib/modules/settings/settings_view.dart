import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/settings_provider.dart';

class SettingsView extends StatefulWidget{
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final List<String> _languages =[
    "English",
     "عربي"
  ];
  final List<String> _themeModes =[
    "Light",
     "Dark"
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context);
    var provider = Provider.of<SettingsProvider>(context);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 70,
              left:35,
              right: 15,
            ),
            width:mediaQuery.size.width ,
            height: mediaQuery.size.height*0.2,
            color: theme.primaryColor,
            child : Text(
                lang!.settings,
                 style: theme.textTheme.bodyLarge!.copyWith(
                     fontSize: 22,
                     fontWeight: FontWeight.bold,
                     color: provider.isDark() ? const Color(0xff141922) : Colors.white),
                 )
              ),

          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              lang.language,
              style: theme.textTheme.titleLarge?.copyWith(
                 color: provider.isDark() ? Colors.white : Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(left: 20.0 , right: 20),
             child: CustomDropdown<String>(
               decoration: CustomDropdownDecoration(
                 closedFillColor: provider.isDark() ? const Color(0xff141922) : Colors.white,
                 expandedFillColor:provider.isDark() ? const Color(0xff141922) : Colors.white ,
                 closedBorderRadius: BorderRadius.zero,
               ),
              hintText: 'Select language',
              items: _languages,
              initialItem: provider.currentLanguage == "en" ?_languages[0]:_languages[1],
              onChanged: (value) {
                 if(value=="English"){
                   provider.changeCurrentLanguage("en");
                 }
                 if(value=="عربي"){
                   provider.changeCurrentLanguage("ar");
                 }
                 log('changing value to: $value');

                   },
             ),
           ),

          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              lang.themeMode,
              style: theme.textTheme.titleLarge?.copyWith(
                color: provider.isDark() ? Colors.white : Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0 , right: 20.0),
            child: CustomDropdown<String>(
              decoration: CustomDropdownDecoration(
                closedFillColor: provider.isDark() ? const Color(0xff141922) : Colors.white,
                expandedFillColor:provider.isDark() ? const Color(0xff141922) : Colors.white ,
                closedBorderRadius: BorderRadius.zero,
              ),
              hintText: 'Select theme',
              items: _themeModes,
              initialItem: provider.currentTheme == ThemeMode.light ?_themeModes[0]:_themeModes[1],
              onChanged: (value) {
                if(value=="Light"){
                  provider.changeCurrentTheme(ThemeMode.light);
                }
                if(value=="Dark"){
                  provider.changeCurrentTheme(ThemeMode.dark);
                }

                log('changing value to: $value');
                 }
              ),
          )
        ],
    )
    ;
  }
}