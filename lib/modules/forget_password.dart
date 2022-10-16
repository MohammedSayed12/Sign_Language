import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_final/component/component.dart';
import 'package:project_final/component/custompaint.dart';
import 'package:project_final/layout/bloc/cubit.dart';
import 'package:project_final/layout/bloc/states.dart';
import 'package:project_final/layout/homelayout.dart';
import 'package:project_final/modules/register.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);

  var keyForm=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Reset Password"),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: keyForm,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value){
                              if(value!.isEmpty){
                                return "Enter Your Email";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
                              suffixIcon: Icon(Icons.email),
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                          ),
                          MaterialButton(
                            color: Colors.deepPurple,
                            height: 50.0,
                            minWidth: 20.0,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                              Text('Send',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                              Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                            ],),
                            onPressed: () {
                              if(keyForm.currentState!.validate()){
                                navigateTO(context, HomeLayout());
                              }else{
                                print("done");
                              }
                            },
                          ),
                          SizedBox(
                            height: 100.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );}
    );
  }
}
