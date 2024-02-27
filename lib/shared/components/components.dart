import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defaultTextFormField({
  required TextInputType type,//
  required String label,//
  required IconData prefix,//
  TextEditingController? controller,
  int maxLines=1,
  final String? Function(String?)? validate,//
  final String? Function(String?)? onSave,//
  final String? Function(String?)? onChanged,//
  final String? Function(String?)? onFieldSubmitted,//
  Function? onTap,
  bool obsecuredText = false,//
  IconData? suffix,//
  void Function()? suffixPressed,//
})=>TextFormField(
  controller: controller,
  keyboardType: type,//
  validator: validate,//
  maxLines: maxLines,
  onSaved: onSave,//
  onChanged: onChanged,
  onFieldSubmitted: onFieldSubmitted,
  onTap: onTap != null ? () => onTap() : null,
  obscureText: obsecuredText,
  decoration: InputDecoration(
    labelText: label,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.pink,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: HexColor('#070929'),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
          color: Colors.white54,

      )
    ),
    prefixIconColor:HexColor('#070929'),
    suffixIconColor: HexColor('#070929'),
    prefixIcon: Icon(prefix),
    suffixIcon: suffix != null
        ? IconButton(
        onPressed: suffixPressed,
        icon: Icon(
          suffix,
        ))
        : null,
    labelStyle: TextStyle(
      color: Colors.white54,

    ),
  ),
);



ScaffoldFeatureController<SnackBar, SnackBarClosedReason> defaultSnackBarMessage(
    {required BuildContext,required String message,required int duration})
{
  return ScaffoldMessenger.of(BuildContext).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: duration),
    ),
  );
}

void pushReplacementNavigateTo(context,widget)
{
  Navigator.pushReplacement(
    context ,
    MaterialPageRoute(builder: (context)
    {return widget;}
    ),
  );

}// Navigator method

void pushNavigateTo(context,widget)
{
  Navigator.pushReplacement(
    context ,
    MaterialPageRoute(builder: (context)
    {return widget;}
    ),
  );

}// Navigator method


//automaticallyImplyLeading: false,

//      large font style
//            style: TextStyle(
//                           fontWeight: FontWeight.w500,//common FontWeight
//                           fontSize: 50,
//                           color: Colors.white54, //must change
//                         ),