import 'package:flutter/material.dart';
import 'package:project_final/component/component.dart';
import 'package:project_final/layout/bloc/cubit.dart';
import 'package:project_final/modules/home/learn/run_video.dart';
import 'package:video_player/video_player.dart';


class LearnNumber extends StatelessWidget {
  const LearnNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0,top: 40.0,),
        child: Column(
          children: [
            // Dismissible(
            //     key: Key('ttt'),
            // child: Image(image: NetworkImage("${AppCubit.get(context).getImage!.image}"),),
            // ),
            SizedBox(height: 10.0,),
            InkWell(
              onTap: (){
                navigateTO(context, RunVideo());
              },
              child: DefaultItemFavorite(title: 'Three',pic: 'assets/images/favorite/i love you.gif',),
            ),
            SizedBox(height: 10.0,),
            DefaultItemFavorite(title: 'Three',pic: 'assets/images/favorite/i love you.gif',),
          ],
        ),
      ),
    );
  }
}
