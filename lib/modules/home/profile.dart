import 'package:flutter/material.dart';
import 'package:project_final/component/component.dart';
import 'package:project_final/layout/bloc/cubit.dart';
import 'package:project_final/modules/login.dart';
import 'package:project_final/shared_pref.dart';

class Profile extends StatelessWidget {
   Profile({Key? key}) : super(key: key);

  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:AppCubit.get(context).getUserDatModel==null?Center(child: CircularProgressIndicator()): Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            SizedBox(height: 20.0,),
            //Text('${AppCubit.get(context).getUserDatModel!.name}',style: TextStyle(fontSize: 23.0,),),
            SizedBox(height: 10.0,),
            ButtonText(text: "Edit Profile",press: (){},),
            SizedBox(height: 10.0,),
            ButtonText(text: "Sign Out",press: (){
              SharedPref.setData("id", null);
              AppCubit.get(context).getUserDatModel=null;
              navigateTO(context,  LoginScreen());
            },),
            SizedBox(height: 20.0,),
            TextFormField(
             // controller: nameController,
              initialValue: AppCubit.get(context).getUserDatModel!.name,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),

              ),
            ),
            SizedBox(height: 30.0,),
            TextFormField(
              //controller: emailController,
              initialValue: AppCubit.get(context).getUserDatModel!.email,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),

              ),
            ),
            SizedBox(height: 30.0,),
            TextFormField(
              //controller: passwordController,
              initialValue: AppCubit.get(context).getUserDatModel!.password,
              readOnly: true,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
