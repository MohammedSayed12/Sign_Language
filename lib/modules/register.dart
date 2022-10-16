import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_final/component/component.dart';
import 'package:project_final/component/custompaint.dart';
import 'package:project_final/layout/bloc/states.dart';
import 'package:project_final/layout/homelayout.dart';
import 'package:project_final/modules/login.dart';

import '../layout/bloc/cubit.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);

  var keyForm = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){
          if (state is SignUpWithEmailSuccess) {
            navigateTO(context, HomeLayout());
            AppCubit.get(context).getUserData();
          }
          if (state is SignUpWithEmailError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.white,
              content: Text(
                'Error, Something went wrong please make sure from your email or password',
                style: TextStyle(color: Colors.red),
              ),
              duration: Duration(milliseconds: 2000),
            ));
            ;
          }
        },
         builder: (context,state){
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: keyForm,
                child: Column(
                  children: [
                    ClipPath(
                      child: Container(
                        color: Colors.deepPurple,
                        height: size.height * 0.33,
                        width: size.width,
                        child: Center(child: Text('Welcome',style: TextStyle(color: Colors.white,fontSize: 30.0),)),
                      ),
                      clipper: WaveClip(),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Your Name";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Name',
                              suffixIcon: Icon(Icons.person),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Your Email";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Email',
                              suffixIcon: Icon(Icons.email),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: !AppCubit.get(context).showPasswordSignUp,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Your password";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                icon: AppCubit.get(context).showPasswordSignUp
                                    ? Icon(Icons.remove_red_eye_outlined)
                                    : Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  AppCubit.get(context).changePasswordIconSignUp();
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            controller: confirmPasswordController,
                            obscureText: !AppCubit.get(context).showPasswordSignUpConfirm,
                            validator: (value) {
                              if (value!=passwordController.text) {
                                return "please make sure from password";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              suffixIcon: IconButton(
                                icon: AppCubit.get(context).showPasswordSignUpConfirm
                                    ? Icon(Icons.remove_red_eye_outlined)
                                    : Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  AppCubit.get(context).changePasswordIconSignUpConfirm();
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          state is LoadingSignUpWithEmail
                              ? CircularProgressIndicator()
                              : MaterialButton(
                            color: Colors.deepPurple,
                            height: 50.0,
                            minWidth: double.infinity,
                            child: Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                            onPressed: () {
                              if (keyForm.currentState!.validate()) {
                                AppCubit.get(context).SignUpWithEmail(nameController.text, emailController.text, passwordController.text);
                              }
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('you already have an account'),
                          SizedBox(
                            height: 10.0,
                          ),
                          MaterialButton(
                            color: Colors.deepPurple,
                            height: 50.0,
                            minWidth: double.infinity,
                            child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                            onPressed: () {
                              navigateTOAndFinish(context, LoginScreen());
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('or login with'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(onPressed: (){}, icon: Image(image: AssetImage('assets/images/icon/google.png')),),
                              IconButton(onPressed: (){}, icon: Image(image: AssetImage('assets/images/icon/face.png')),),
                              IconButton(onPressed: (){}, icon: Image(image: AssetImage('assets/images/icon/twitter.png')),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
         },
    );
  }
}
