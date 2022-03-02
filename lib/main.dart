import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/layout/%20cubit/cubit.dart';
import 'package:shop_app/layout/%20cubit/status.dart';
import 'package:shop_app/layout/shop_app.dart';
import 'package:shop_app/modules/on_barding_screen/onb_arding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  bool isDark=CashHelper.getBool(key: 'isDark');
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopCubit(),
      child: BlocConsumer<ShopCubit,ShopStatus>(
        listener: (context, state) {},
        builder:  (context, state) {
          return MaterialApp(

            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  color: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                      color: Colors.black
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness:Brightness.dark,
                    statusBarColor: Colors.white,
                  ),
                  iconTheme: IconThemeData(
                      color: Colors.black
                  ),
                ),
                bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.indigo.shade900,
                  unselectedItemColor:Colors.indigo.shade200 ,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontSize:18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  bodyText2:  TextStyle(
                    color: Colors.black54,
                  ),

                ),
                fontFamily: 'fontone'
            ),
            darkTheme: ThemeData(
                scaffoldBackgroundColor:Colors.grey.shade900,
                appBarTheme:  AppBarTheme(
                  color:Colors.grey.shade900,
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness:Brightness.light,
                    statusBarColor:Colors.grey.shade900,
                  ),
                  iconTheme: const IconThemeData(
                      color: Colors.white
                  ),

                ),
                bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor:Colors.white60 ,
                  selectedItemColor: Colors.white,
                  backgroundColor: Colors.grey.shade900,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontSize:18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  bodyText2:  TextStyle(
                    color: Colors.white54,

                  ),


                ),
                fontFamily: 'fontone'


            ),
            themeMode: ThemeMode.light,

            home: const onBardingScreen(),
          );
        },

      ),
    );
  }
}
