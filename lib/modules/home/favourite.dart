import 'package:flutter/material.dart';
import 'package:project_final/component/component.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          top: 10.0,
        ),
        child: Column(
          children: [
            Dismissible(
              key: Key('ttt'),
              onDismissed: (direction){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.white,
                  content: Text(
                    'Error, Something went wrong please make sure from your email or password',
                    style: TextStyle(color: Colors.red),
                  ),
                  duration: Duration(milliseconds: 2000),
                ));
              },
              child: DefaultItemFavorite(
                title: 'hello',
                pic: 'assets/images/favorite/HELLO.gif',
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            DefaultItemFavorite(
              title: 'how are you',
              pic: 'assets/images/favorite/how are you.gif',
            ),
            SizedBox(
              height: 10.0,
            ),
            DefaultItemFavorite(
              title: 'i love you',
              pic: 'assets/images/favorite/i love you.gif',
            ),
          ],
        ),
      ),
    );
  }
}
