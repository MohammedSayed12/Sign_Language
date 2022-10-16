import 'package:flutter/material.dart';
import 'package:project_final/component/component.dart';


class LearnDays extends StatelessWidget {
  const LearnDays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0,top: 10.0,),
        child: Column(
          children: [
            Dismissible(
                key: Key('ttt'),
                //direction: (){},
                child: DefaultItemFavorite(title: 'One',pic: 'assets/images/favorite/HELLO.gif',)),
            SizedBox(height: 10.0,),
            DefaultItemFavorite(title: 'Two',pic: 'assets/images/favorite/how are you.gif',),
            SizedBox(height: 10.0,),
            DefaultItemFavorite(title: 'Three',pic: 'assets/images/favorite/i love you.gif',),
          ],
        ),
      ),
    );
  }
}
