import 'package:flutter/material.dart';
import 'package:project_final/component/component.dart';
import 'package:project_final/modules/home/learn/number.dart';

class Learn extends StatelessWidget {
  const Learn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0,left: 10.0,right: 10.0,),
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.78,
                children: [
                  InkWell(
                    onTap:( ){navigateTO(context, LearnNumber());},
                      child: DefaultItemLearn(title: 'Number',pic: 'assets/images/numbers.png',)),
                  InkWell(
                      onTap:( ){navigateTO(context, LearnNumber());},
                      child: DefaultItemLearn(title: 'Days',pic: 'assets/images/day.png',)),
                  InkWell(
                      onTap:( ){navigateTO(context, LearnNumber());},
                      child: DefaultItemLearn(title: 'Alphabet',pic: 'assets/images/alpha.png',)),
                  InkWell(
                      onTap:( ){navigateTO(context, LearnNumber());},
                      child: DefaultItemLearn(title: 'Colors',pic: 'assets/images/color.png',)),
                  InkWell(
                      onTap:( ){navigateTO(context, LearnNumber());},
                      child: DefaultItemLearn(title: 'Five Senses',pic: 'assets/images/senses.png',)),
                  InkWell(
                      onTap:( ){navigateTO(context, LearnNumber());},
                      child: DefaultItemLearn(title: 'Family',pic: 'assets/images/onboarding0.jpeg',)),
                ],
              ),
            ),
      ),
    );
  }
}
