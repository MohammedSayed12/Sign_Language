import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DefaultPage extends StatelessWidget {
  var controller=PageController();
  String photo;
  String title;

  DefaultPage({required this.controller, this.photo='assets/images/onboarding0.jpeg',required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage('$photo')),
        SizedBox(height: 20.0,),
        SmoothPageIndicator(
          controller: controller,
          count:  3,
          axisDirection: Axis.horizontal,
          effect:  SlideEffect(
              spacing:  8.0,
              radius:  5.0,
              dotWidth:  12.0,
              dotHeight:  12.0,
              paintStyle:  PaintingStyle.stroke,
              strokeWidth:  1.5,
              dotColor:  Colors.grey,
              activeDotColor:  Colors.indigo
          ),
        ),
        SizedBox(height: 30.0,),
        Text('$title',style: TextStyle(fontSize: 17.0,),maxLines: 2,textAlign: TextAlign.center,),
      ],
    );
  }
}

class DefaultItemFavorite extends StatelessWidget {
String pic;
String title;
DefaultItemFavorite({required this.pic,required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      child: Row(
        children: [
          Text('$title',style: TextStyle(fontSize: 18.0),),
          Spacer(),
          Image(image: AssetImage('$pic'),height: 100.0,),
        ],
      ),
    );
  }
}

class DefaultItemLearn extends StatelessWidget {
   String title;
   String pic;
   DefaultItemLearn({required this.title,required this.pic,});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: AssetImage('$pic'),height: 160.0,),
          //SizedBox(height: 10.0,),
          Text('$title',style: TextStyle(fontSize: 18.0),),
        ],
      ),
    );
  }
}

class ButtonText extends StatelessWidget {

  String text;
  dynamic press;
  ButtonText({required this.text,this.press});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: press, child: Text(text,style: TextStyle(fontSize: 18.0,),),
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}


Future<dynamic> navigateTOAndFinish(context,screen){
   return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>(screen)), (route) => false);
}

Future<dynamic> navigateTO(context,screen){
   return Navigator.push(context, MaterialPageRoute(builder: (context)=>(screen)),);
}

