import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/modules/login_screen/login_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/styles/colors/colors.dart';

class signUpPassword extends StatelessWidget {
  signUpPassword({Key? key}) : super(key: key);
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
                  'Choose Password ',
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
                  keyboardType: TextInputType.visiblePassword,
                  onTap: (){},
                  readOnly: false,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Password?';
                    }
                  },
                  decoration: InputDecoration(
                    hintText:'Password',
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
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => loginScreen(),),
                              (Route<dynamic> route)=>false,
                        );

                      };

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
