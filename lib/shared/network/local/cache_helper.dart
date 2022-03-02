import 'package:shared_preferences/shared_preferences.dart';
class CashHelper{
  static SharedPreferences ?shardPreferences;

  static init()async
  {
    shardPreferences= await SharedPreferences.getInstance() ;
  }
  static Future <bool>putBool({
    required String key,
    required bool value,
  }) async{
    return await shardPreferences!.setBool(key, value);
  }
  static bool getBool({
    required String key,
  }){
    return shardPreferences!.getBool(key)??false;
  }
}
