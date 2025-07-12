import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../my_theme/app_colors.dart';
import 'hadeth_content.dart';
import 'hadeth_item.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if(ahadethList.isEmpty){
      loadHadethFile();
    }
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: Image.asset("assets/images/hadeth_logo.png")
        ),
        Divider(
          thickness: 3,
          color: Theme.of(context).primaryColor,
        ),

        SizedBox(height: 8,),
        Center(
          child: Text(
            "Hadeth Name",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        SizedBox(height: 8,),

        Divider(
          thickness: 3,
          color: Theme.of(context).primaryColor,
        ),


        ahadethList.isEmpty ?
        Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryLightColor,
          ),
        ) :

        Expanded(
          flex: 5,

          child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 2,
                  color: Theme.of(context).primaryColor,
                );
              },

              itemBuilder: (context, index) {
                return HadethItem(title: ahadethList[index].title , content: ahadethList[index].content,);
              },
              itemCount: ahadethList.length),
        ),
      ],
    );
  }

  void loadHadethFile()async{
    String hadethContent = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadethList = hadethContent.split("#\r\n");
    for(int i = 0 ; i < hadethList.length ; i++){
      List<String> hadethLines = hadethList[i].split("\n");
      String hadethTitle = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(content: hadethLines, title: hadethTitle);
      ahadethList.add(hadeth);
      print(hadeth.title);
      setState(() {
      });
    }
  }
}
