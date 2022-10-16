
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_final/layout/bloc/states.dart';
import 'package:project_final/model/image.dart';
import 'package:project_final/model/user_model.dart';
import 'package:project_final/modules/home/favourite.dart';
import 'package:project_final/modules/home/home_page/home.dart';
import 'package:project_final/modules/home/learn/learn.dart';
import 'package:project_final/modules/home/profile.dart';
import 'package:project_final/modules/home/setting.dart';
import 'package:project_final/shared_pref.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppStates());
  static AppCubit get(context) => BlocProvider.of(context);

  var currentIndex = 2;
  void changeBottomNavBar(index) {
    currentIndex = index;
    emit(ChangeBottomNavBarStates());
  }

  List<String> tittle = [
    'Favourite',
    'Learn',
    'Home',
    'Profile',
    'Setting',
  ];
  List<Widget> pageHome = [
    Favorite(),
    Learn(),
    Home(),
    Profile(),
    Setting(),
  ];
  bool showPasswordLogin = false;
  bool showPasswordSignUp = false;
  bool showPasswordSignUpConfirm = false;

  void changePasswordIconLogin() {
    showPasswordLogin = !showPasswordLogin;
    emit(ChangeIconPasswordLogin());
  }

  void changePasswordIconSignUp() {
    showPasswordSignUp = !showPasswordSignUp;
    emit(ChangeIconPasswordSignUp());
  }

  void changePasswordIconSignUpConfirm() {
    showPasswordSignUpConfirm = !showPasswordSignUpConfirm;
    emit(ChangeIconPasswordSignUpConfirm());
  }

  UserModel? userModel;
  void createUserOnFirestore(name,email,password,id,image)async{
    userModel=UserModel(
      name:name,
      email:email,
      password:password,
      id:id,
      image:image,
    );
    print(email);
    await FirebaseFirestore.instance.collection("users").doc("$id").set(userModel!.toMap()).then((value) {
      emit(CreateDataSuccess());
      print("val");
    }).catchError((onError){
      emit(CreateDataError());
      print(onError);
    });
  }

  String? id;
  void loginByEmail(email, password) async {
    emit(LoadingLoginByEmail());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          id =value.user!.uid;
          print(id);
      SharedPref.setData("id", id);
      emit(LoginByEmailSuccess());
      print(SharedPref.getData("id"));
    }).catchError((error) {
      emit(LoginByEmailError());
      print(error.toString());
    });
  }

  void SignUpWithEmail(name,email, password) async {
    emit(LoadingSignUpWithEmail());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
          createUserOnFirestore(name, email, password,value.user!.uid,"noImage");
          SharedPref.setData("id", value.user!.uid);
          getUserData();
          emit(SignUpWithEmailSuccess());
    })
        .catchError((onError) {
          emit(SignUpWithEmailError());
      print(onError.toString());
    });
  }

  UserModel? getUserDatModel;
  void getUserData(){
     FirebaseFirestore.instance.collection("users").doc(SharedPref.getData("id")).get().then((value) {
       getUserDatModel=UserModel.fromJson(value.data());
      print(getUserDatModel!.name);
       emit(GetUserDataSuccess());
    }).catchError((onError){
      print("object");
      emit(GetUserDataError());
    });
  }


  void signWithGoogle()async{
    await GoogleSignIn().signIn().then((value) {

      print(value);
    }).catchError((onError){
      print(onError);
    });
  }


  XFile? profileImage;

  var picker = ImagePicker();

  void pickProfileImage() async {
    final  image = await picker.pickImage(source: ImageSource.camera,preferredCameraDevice: CameraDevice.front);
    if (image != null) {
      profileImage = XFile(image.path);
      print(profileImage);
      emit(ChangeProfileImageSuccess());
    } else {
      debugPrint('No image selected.');
      emit(ChangeProfileImageError());
    }
  }

  GetImage? getImage;
  List<String>? videoName;
  String? a;
  dynamic videoAddress=[];
  void getLearn()async{
    await FirebaseFirestore.instance.collection("learning").doc("colors").get().then((value) {

      // print(value.data());
       getImage=GetImage.fromJson(value.data());
       //print(getImage!.videoName![0]);
    }).catchError((onError){
      print(onError);
    });
  }


}
