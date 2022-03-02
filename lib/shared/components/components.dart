import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/shared/network/remote/remote.dart';
import 'package:shop_app/styles/colors/colors.dart';

Widget buildOnbardingItem(BordingModel model)=>Padding(
  padding: const EdgeInsets.all(15.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       Expanded(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Image(
            image: AssetImage(model.image),
            // color: Colors.indigo.shade900,
            // height: 300,
            // width: 300,
          ),
        ),
      ),
      Text(model.title,
        style: TextStyle(
            fontSize: 30,
            color: colorone
        ),
      ),
      const SizedBox(
        height: 40.0,
      ),
      Text(model.body,
        style: TextStyle(
            fontSize: 18,
            color: colortwo,
        ),),



    ],
  ),
);

Widget defaultTextFelid({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  required String textErrorValidate,
  required double borderRadiusDouble,
  required Function() onnTap,
  required bool readOnly,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: (val) {
        print(val);
      },
      onChanged: (val) {
        print(val);
      },
      onTap: onnTap,
      readOnly: readOnly,
      validator: (val) {
        if (val!.isEmpty) {
          return textErrorValidate;
        }
      },
      decoration: InputDecoration(
        // hintText: 'Email',
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusDouble),
          gapPadding: 5,
        ),
        prefixIcon: Icon(prefix),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.cyan,
  required Function() function, // تنساااااااااااااش ()
  required String text,
  double radues = 10.0,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radues),
      ),
    );