import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height:40.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About Us',style: TextStyle(fontSize: 20.0,),),
                ],
              ),
            ),
            //SizedBox(height: 10.0,),
            Container(
              height:40.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact Us',style: TextStyle(fontSize: 18.0,),),
                ],
              ),
            ),
            //SizedBox(height: 5.0,),
            Container(
              height:40.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Help',style: TextStyle(fontSize: 18.0,),),
                ],
              ),
            ),
            Container(
              height:40.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Log Out',style: TextStyle(fontSize: 18.0,),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
