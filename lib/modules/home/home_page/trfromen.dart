
import 'package:flutter/material.dart';

class TranslateFromEnglish extends StatelessWidget {
   TranslateFromEnglish({Key? key}) : super(key: key);
  var textController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Home'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/hi.gif'),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: TextFormField(
          controller: textController,
          decoration: InputDecoration(
            hintText: 'Type To Translate',
          )
        ),
      ),
    );
  }
}
