import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/layout/%20cubit/cubit.dart';
import 'package:shop_app/layout/%20cubit/status.dart';
import 'package:shop_app/modules/login_screen/login_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/styles/colors/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBardingScreen extends StatelessWidget {
  const onBardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStatus>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => loginScreen(),),
                          (Route<dynamic> route)=>false,
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                  )
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (int index){
                      if (index==ShopCubit.get(context).bording.length -2 ){
                        ShopCubit.get(context).lastScreenBoard=true;

                      }else{
                        ShopCubit.get(context).lastScreenBoard=false;
                      }
                    },
                    controller: ShopCubit.get(context).boardController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildOnbardingItem(ShopCubit.get(context).bording[index]),
                    itemCount: ShopCubit.get(context).bording.length,

                  ),
                ),
                Row(
                  children: [
                    SmoothPageIndicator(
                        controller: ShopCubit.get(context).boardController,  // PageController
                        count:  ShopCubit.get(context).bording.length,
                        effect:  ExpandingDotsEffect(
                          dotColor:colortwo,
                          activeDotColor: colorone,
                          dotWidth: 10,
                          dotHeight: 8,
                          expansionFactor: 4,
                         spacing: 5.0
                        ),
                      // your preferred effect

                    ),
                    const Spacer(),     //مسافة
                    IconButton(
                      onPressed: (){
                        if (ShopCubit.get(context).lastScreenBoard==false){
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => loginScreen(),),
                              (Route<dynamic> route)=>false,
                             );
                        }else{
                          ShopCubit.get(context).boardController.nextPage(
                            duration: const Duration(
                              milliseconds: 800,
                            ),
                            curve:Curves.fastLinearToSlowEaseIn,
                          );
                        }

                      },
                      icon: const Icon(Icons.keyboard_arrow_right_outlined),
                      color: colorone,
                      iconSize: 40,
                    ),

                  ],
                )
              ],
            ),

          ),

        );
      },


    );
  }
}
