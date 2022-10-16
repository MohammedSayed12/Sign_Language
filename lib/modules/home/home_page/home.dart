import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_final/component/component.dart';
import 'package:project_final/modules/home/home_page/trfromen.dart';
import 'package:project_final/modules/home/home_page/trtfromsign.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){navigateTO(context, TranslateFromSign());},
                    child: Column(
                      children: [
                        Expanded(child: Image(image: AssetImage('assets/images/traFromSign.png'),)),
                        SizedBox(height: 20.0,),
                        Text('Translate From Sign To English',textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      navigateTO(context, TranslateFromEnglish());
                    },
                    child: Column(
                      children: [
                        Expanded(child: Image(image: AssetImage('assets/images/traFromEnglish.png'),)),
                        SizedBox(height: 20.0,),
                        Text('Translate From English To Sign',textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),)
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(child: Image(image: AssetImage('assets/images/common.png'),)),
                      SizedBox(height: 20.0,),
                      Text('Common Sentences',textAlign: TextAlign.center,),
                    ],
                  ),
                ),),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(child: Image(image: AssetImage('assets/images/news.png'),)),
                      SizedBox(height: 20.0,),
                      Text('News about Sign Language',textAlign: TextAlign.center,),
                    ],
                  ),
                ),)
              ],
            ),
          ),
          SizedBox(height: 90.0,),
        ],
      ),
    );
  }
}
