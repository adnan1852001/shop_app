import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/modules/sign_up_password/sign_up_password.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/styles/colors/colors.dart';

class signUpUserName extends StatelessWidget {
  signUpUserName({Key? key}) : super(key: key);
    var  signUpControlar= TextEditingController();
    var formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children:
              [
              const SizedBox(
                  height: 100,
                ),
              Text(
                'Choose user name ',
                style: TextStyle(
                  color: colorone,
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                  height: 20,
                ),
              Text(
                    'You can always change it later',
                ),
              const SizedBox(
                  height: 20,
                ),
              TextFormField(
              controller: signUpControlar,
              keyboardType: TextInputType.emailAddress,
              onTap: (){},
              readOnly: false,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'User name?';
                }
              },
              decoration: InputDecoration(
                hintText:'User name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  gapPadding: 5,
                ),
              ),
            ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: defaultButton(
                  width: double.infinity,
                  background: colorone,
                  text: 'Next',
                  radues: 5,
                  function: (){
                    if (formKey.currentState!.validate()){
                      print(signUpControlar.text);
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder:(context)=>signUpPassword())
                      );
                    }


                    },
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
