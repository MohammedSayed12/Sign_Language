import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_final/component/component.dart';
import 'package:project_final/modules/login.dart';

class OnBoarding extends StatefulWidget {
   OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
   bool pageEnd=false;

  var pageView=PageController();

  @override
  Widget build(BuildContext context) {
    List<DefaultPage>page=[
      DefaultPage(controller: pageView,photo: 'assets/images/on1.png',title: 'with this app you can translate sign language and chat with your friends ',),
      DefaultPage(controller: pageView,photo: 'assets/images/on2.png',title: 'and learn many things such as colors,days and more',),
      DefaultPage(controller: pageView,photo: 'assets/images/on3.png',title: 'now click on start to create an account and enjoy',),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 3,
        controller: pageView,
        onPageChanged: (index){
          if(index==2){
            setState(() {
              pageEnd=true;
              print('last');
            });
          }else{
            setState(() {
              pageEnd=false;
            });
          }
        },
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                page[index],
                SizedBox(height: 60.0,),
                pageEnd?MaterialButton(
                  minWidth: 150.0,
                  height: 45.0,
                  color: Colors.deepPurple,
                  onPressed: (){
                    navigateTOAndFinish(context, LoginScreen());
                  },
                  child: Text('Start',style: TextStyle(color: Colors.white),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ):MaterialButton(
                  minWidth: 150.0,
                  height: 45.0,
                  color: Colors.deepPurple,
                  onPressed: (){
                    pageView.nextPage(duration: Duration(microseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
                  },
                  child: Text('next',style: TextStyle(color: Colors.white),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                SizedBox(height: 60.0,),
              ],
            ),
          );
        },
      ),
    );
  }
}
