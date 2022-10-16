import 'package:flutter/material.dart';
import 'package:project_final/component/component.dart';
import 'package:project_final/details.dart';
import 'package:tflite/tflite.dart';

class TranslateFromSign extends StatefulWidget {
  TranslateFromSign({Key? key}) : super(key: key);

  @override
  State<TranslateFromSign> createState() => _TranslateFromSignState();
}

class _TranslateFromSignState extends State<TranslateFromSign> {
  var textController=TextEditingController();

  loadmodel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void initState() {
    super.initState();

    loadmodel();
  }

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
          FloatingActionButton(onPressed: (){
            navigateTO(context, HomeCameraD());
          },child: Icon(Icons.add),),
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
