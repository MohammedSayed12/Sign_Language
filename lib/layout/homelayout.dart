import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_final/component/custompaint.dart';
import 'package:project_final/layout/bloc/cubit.dart';
import 'package:project_final/layout/bloc/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (state, context) {},
      builder: (state, context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${cubit.tittle[cubit.currentIndex]}'),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.access_time),
            onPressed: (){
              cubit.getLearn();
            },
          ),
          body: Stack(
            children: [
              cubit.pageHome[cubit.currentIndex],
              Positioned(
                left: 0.0,
                bottom: 0.0,
                child: Container(
                  height: 70.0,
                  width: size.width,
                  child: Stack(
                    children: [
                      CustomPaint(
                        size: Size(size.width, 80),
                        painter: CustomPainterNavigationBar(),
                      ),
                      Center(
                        heightFactor: 0.5,
                        child: InkWell(
                          onTap: (){
                            cubit.changeBottomNavBar(2);
                          },
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundColor:Colors.deepPurple,
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.home,
                                color: cubit.currentIndex == 2
                                    ? Colors.white
                                    : Colors.blueGrey,),
                                Text('Home',style: TextStyle(fontSize: 12.0,
                                  color: cubit.currentIndex == 2
                                      ? Colors.white
                                      : Colors.blueGrey,
                                ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width,
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                cubit.changeBottomNavBar(0);
                              },
                              child:Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.favorite,color: cubit.currentIndex == 0
                                      ? Colors.white
                                      : Colors.blueGrey,),
                                  Text('Favorite',style: TextStyle(
                                    color: cubit.currentIndex == 0
                                        ? Colors.white
                                        : Colors.blueGrey,
                                  ),),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                cubit.changeBottomNavBar(1);
                              },
                              child:Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.book,color: cubit.currentIndex == 1
                                      ? Colors.white
                                      : Colors.blueGrey,),
                                  Text('Learn',style: TextStyle(
                                    color: cubit.currentIndex == 1
                                  ? Colors.white
                                      : Colors.blueGrey,
                                  ),),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width * 0.20,
                            ),
                            InkWell(
                              onTap: (){
                                cubit.changeBottomNavBar(3);
                              },
                              child:Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.person,color: cubit.currentIndex == 3
                                      ? Colors.white
                                      : Colors.blueGrey,),
                                  Text('Profile',style: TextStyle(
                                    color: cubit.currentIndex == 3
                                        ? Colors.white
                                        : Colors.blueGrey,
                                  ),),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                cubit.changeBottomNavBar(4);
                              },
                              child:Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.settings,color: cubit.currentIndex == 4
                                      ? Colors.white
                                      : Colors.blueGrey,),
                                  Text('Settings',style: TextStyle(
                                    color: cubit.currentIndex == 4
                                        ? Colors.white
                                        : Colors.blueGrey,
                                  ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


//
// FloatingActionButton(
// backgroundColor:Colors.deepPurple,
// child: Icon(Icons.home,
// color: cubit.currentIndex == 2
// ? Colors.white
//     : Colors.grey.shade400,),
// elevation: 0.1,
// onPressed: () {
// cubit.changeBottomNavBar(2);
// }),