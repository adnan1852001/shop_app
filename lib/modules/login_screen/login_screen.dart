import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/layout/%20cubit/cubit.dart';
import 'package:shop_app/layout/%20cubit/status.dart';
import 'package:shop_app/modules/sign_up_username/sign_up.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/styles/colors/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class loginScreen extends StatelessWidget {
   loginScreen({Key? key}) : super(key: key);
  var  emailControlar= TextEditingController();
  var  passwordControlar= TextEditingController();
   var formkey=GlobalKey<FormState>();
//******************************************************************
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStatus>(
      listener: (context, state){},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children:
                [
                  const Padding(
                    padding: EdgeInsets.all(100.0),
                    child: Image(
                      image:AssetImage('images/shopping-bag (1).png'),

                    ),
                  ),
                        Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children:
                      [
                        defaultTextFelid(
                          controller: emailControlar,
                          onnTap: (){},
                          label: 'User name',
                          prefix: Icons.person,
                          borderRadiusDouble: 20,
                          type: TextInputType.emailAddress,
                          readOnly: false,
                          textErrorValidate: 'Please enter the user name',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultTextFelid(
                          controller: passwordControlar,
                          onnTap: (){},
                          label: 'Password',
                          prefix: Icons.password_outlined,
                          borderRadiusDouble: 20,
                          type: TextInputType.visiblePassword,
                          readOnly: false,
                          textErrorValidate: 'Please enter the password',
                        )
                      ],
                    ),
                  ),
                        Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultButton(
                  text: 'Login',
                  width:double.infinity,
                  function:(){
                    if (formkey.currentState!.validate()){
                      print(emailControlar.text);
                      print (passwordControlar.text);
                    ShopCubit.get(context).userLogin(
                      email: emailControlar.text,
                      password:passwordControlar.text ,

                    );
                    }
                  },
                  background: Colors.tealAccent.shade700,
                  radues: 10
              ),
            ),
                        Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      const Text(
                        'Don\'t have an account? ',


                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder:(context)=>signUpUserName())
                            );
                          },
                          child:Text(
                            'Sign up',
                            style: TextStyle(
                                color: colorone
                            ),
                          )
                      ),


                    ],
                  )

                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
