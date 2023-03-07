import 'package:arabic_made_easy/animals_quiz.dart';
import 'package:arabic_made_easy/quick_box.dart';
import 'package:arabic_made_easy/settings.dart';
import 'package:arabic_made_easy/settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings_to_text.dart';

import 'animals.dart';
import 'second_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsNotifier>(
      builder: (_, notifier, __) {
        bool audioFirst = notifier.displayOptions.entries
            .firstWhere((element) => element.key == Settings.audioOnly)
            .value;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 32, 6, 96),
                    Color.fromARGB(255, 57, 119, 194),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
                child: GNav(
                  gap: 15,
                  padding: const EdgeInsets.all(6),
                  backgroundColor: Colors.transparent,
                  textStyle: const TextStyle(
                    fontFamily: 'Akaya',
                    fontSize: 18,
                    color: Color.fromARGB(255, 235, 234, 243),
                    fontWeight: FontWeight.bold,
                  ),
                  tabBackgroundColor: const Color.fromARGB(161, 6, 12, 58),
                  color: const Color.fromARGB(255, 235, 234, 243),
                  activeColor: const Color.fromARGB(255, 235, 234, 243),
                  onTabChange: (index) {
                    if (index == 0) {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          setState(
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PageTwo(),
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else if (index == 1) {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          setState(
                            () {},
                          );
                        },
                      );
                    }
                  },
                  tabs: const [
                    GButton(
                      icon: Icons.class_,
                      text: 'Classes',
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'Settings',
                    ),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 32, 6, 96),
                      Color.fromARGB(255, 57, 119, 194),
                    ],
                  ),
                ),
              ),
              title: const Center(
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'Akaya',
                    fontSize: 25,
                    color: Color.fromARGB(255, 235, 234, 243),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 125, 173, 232),
                    Color.fromARGB(255, 20, 0, 70),
                  ],
                ),
              ),
              child: Center(
                child: SafeArea(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SwitchButton(
                            disabled: audioFirst,
                            displayOption: Settings.englishFirst,
                          ),
                          const SwitchButton(
                            displayOption: Settings.showPronunciation,
                          ),
                          const SwitchButton(
                            displayOption: Settings.audioOnly,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Color.fromARGB(78, 0, 17, 115),
                          ),
                          ListTile(
                            horizontalTitleGap: 1,
                            leading: const Icon(
                              Icons.restore,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            title: const Text(
                              'Reset Settings',
                              style: TextStyle(
                                fontFamily: 'Akaya',
                                fontSize: 18,
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              runQuickBox(
                                  text: 'App Settings Have Been Reset!',
                                  context: context);
                              clearPreferences();
                              notifier.resetSettings();
                            },
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Color.fromARGB(78, 0, 17, 115),
                          ),
                          ListTile(
                            horizontalTitleGap: 1,
                            leading: const Icon(
                              Icons.exit_to_app,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            title: const Text(
                              'Exit App',
                              style: TextStyle(
                                fontFamily: 'Akaya',
                                fontSize: 18,
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              SystemChannels.platform
                                  .invokeMethod('SystemNavigator.pop');
                            },
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Color.fromARGB(78, 0, 17, 115),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void clearPreferences() {
    SharedPreferences.getInstance().then((prefs) {
      for (var e in SettingsNotifier().displayOptions.entries) {
        prefs.remove('guidebox');
      }
    });
  }

  runQuickBox({required String text, required BuildContext context}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => QuickBox(text: text),
    );
    Future.delayed(Duration(milliseconds: 1000), () {
      Navigator.maybePop(context);
    });
  }
}

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    required this.displayOption,
    Key? key,
    this.disabled = false,
  }) : super(key: key);

  final Settings displayOption;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsNotifier>(
        builder: (_, notifier, __) => Column(
              children: [
                SwitchListTile(
                    activeColor: const Color.fromARGB(255, 35, 61, 155),
                    inactiveThumbColor: Colors.black.withOpacity(0.5),
                    tileColor: disabled
                        ? Colors.black.withOpacity(0.2)
                        : Colors.transparent,
                    title: Text(
                      displayOption.toText(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 235, 234, 243),
                        fontFamily: 'Akaya',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: notifier.displayOptions.entries
                        .firstWhere((element) => element.key == displayOption)
                        .value,
                    onChanged: disabled
                        ? null
                        : (value) {
                            notifier.updateDisplayOptions(
                                displayOption: displayOption, isToggled: value);
                          }),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color.fromARGB(78, 0, 17, 115),
                ),
              ],
            ));
  }
}
