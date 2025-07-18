import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../providers/app_config_provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>{
  int counter = 0;
  double turns = 0;

  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "استغفر الله",
    "لا حول ولا قوة إلا بالله",
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment.center,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*0.35
                  ),
                  child: provider.isDarkMode()
                      ? Image.asset("assets/images/sebha_head_night_logo.png")
                      : Image.asset("assets/images/sebha_head_logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*0.099
                  ),
                  child: AnimatedRotation(
                    duration: Duration(milliseconds: 300),
                    turns: turns,
                    child: provider.isDarkMode()
                      ? Image.asset("assets/images/sebha_body_night_logo.png")
                      : Image.asset("assets/images/sebha_body_logo.png"),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.praises_number,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 35
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "$counter",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: provider.isDarkMode()
                            ? AppColors.whiteColor
                            : AppColors.blackColor),
                  ),
                ),
                const SizedBox(
                  height: 27,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: provider.isDarkMode()
                        ? AppColors.yellowColor
                        : AppColors.primaryLightColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  ),
                  onPressed: () {
                    setState(() {
                      if (counter == 30) {
                        index++;
                        if (index == azkar.length) {
                          index = 0;
                        }
                        counter = 0;
                      }
                      turns += 0.033;
                      counter++;
                    });
                  },
                  child: Text(azkar[index],
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: provider.isDarkMode()
                              ? AppColors.whiteColor
                              : AppColors.blackColor)),
                ),
              ],
            ))
      ],

    );
  }
}
