import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/%20cubit/status.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/network/remote/end_points.dart';
import 'package:shop_app/shared/network/remote/remote.dart';
class ShopCubit extends Cubit<ShopStatus>{
  ShopCubit( ) : super(shopLoginInitialStates());
  static ShopCubit get(context)=>BlocProvider.of(context);

  List<BordingModel>bording=[
    BordingModel(
      image: 'images/store.png',
      title:'shopping' ,
      body: 'Shop through your app ',

    ),
    BordingModel(
      image: 'images/store.png',
      title:' Online shopping' ,
      body: 'Now you can shop through your mobile ',

    ),
    BordingModel(
      image: 'images/store.png',
      title:'Let\'s go?' ,
      body: 'We work for your convenience ',

    ),
  ];
  var boardController= PageController();
  bool lastScreenBoard=true;
 //*****************************************shopLoginSuccessState**************
 void userLogin({
     required String email,
     required String password,
   }){
   emit(shopLoginLoadingState());
   DioHelper.postData(

       url: LOGIN,
       data:{
         'email':email,
         'password':password,
       }
   ).then((value) {
     print(value.data);
     print ('mdddddddddddddddddddd');
     emit(shopLoginSuccessState());
   }).catchError((error){
     emit(shopLoginErrorState(error.toString()));
   });

 }

}