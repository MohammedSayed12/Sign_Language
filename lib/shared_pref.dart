import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  static SharedPreferences? sharedPreferences;

  static Future init()async{
   return  sharedPreferences=await SharedPreferences.getInstance();
  }

  static getData(key){
    return sharedPreferences!.get(key);
  }

  static Future setData(key,value)async{
    if(value is String){
      return await sharedPreferences!.setString(key, value);
    }
    else if(value is int){
      return sharedPreferences!.setInt(key, value);
    }
    else if(value is bool){
      return sharedPreferences!.setBool(key, value);
    }
    else{
      return sharedPreferences!.setDouble(key, value);
    }

  }

}