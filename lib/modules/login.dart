import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_final/component/component.dart';
import 'package:project_final/component/custompaint.dart';
import 'package:project_final/layout/bloc/cubit.dart';
import 'package:project_final/layout/bloc/states.dart';
import 'package:project_final/layout/homelayout.dart';
import 'package:project_final/modules/forget_password.dart';
import 'package:project_final/modules/register.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var keyForm = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is LoginByEmailSuccess) {
        navigateTO(context, HomeLayout());
        AppCubit.get(context).getUserData();
      }
      else if (state is LoginByEmailError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            'Error, Something went wrong please make sure from your email or password',
            style: TextStyle(color: Colors.red),
          ),
          duration: Duration(milliseconds: 2000),
        ));
      }
    }, builder: (context, state) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                child: Container(
                  color: Colors.deepPurple,
                  height: size.height * 0.38,
                  width: size.width,
                  child: Center(
                      child: Text(
                    'Welcome',
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  )),
                ),
                clipper: WaveClip(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: keyForm,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
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
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: !AppCubit.get(context).showPasswordLogin,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Your Password";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: AppCubit.get(context).showPasswordLogin
                                ? Icon(Icons.remove_red_eye_outlined)
                                : Icon(Icons.remove_red_eye),
                            onPressed: () {
                              AppCubit.get(context).changePasswordIconLogin();
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: () {
                            navigateTO(context, ForgetPassword());
                          },
                          child: Text(
                            'Forget Password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      state is LoadingLoginByEmail
                          ? CircularProgressIndicator()
                          : MaterialButton(
                              color: Colors.deepPurple,
                              height: 50.0,
                              minWidth: double.infinity,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                              onPressed: () {
                                if (keyForm.currentState!.validate()) {
                                  AppCubit.get(context).loginByEmail(
                                      emailController.text,
                                      passwordController.text);
                                }
                              },
                            ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('You don\'t have an account'),
                          ButtonText(
                            text: " SignUp",
                            press: () {
                              navigateTO(context, RegisterScreen());
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      // MaterialButton(
                      //   color: Colors.deepPurple,
                      //   height: 50.0,
                      //   minWidth: double.infinity,
                      //   child: Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                      //   onPressed: () {
                      //     navigateTOAndFinish(context, RegisterScreen());
                      //   },
                      // ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('or login with'),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              AppCubit.get(context).signWithGoogle();
                            },
                            icon: Image(
                                image: AssetImage(
                                    'assets/images/icon/google.png')),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image(
                                image:
                                    AssetImage('assets/images/icon/face.png')),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image(
                                image: AssetImage(
                                    'assets/images/icon/twitter.png')),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
