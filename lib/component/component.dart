
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void NavegatTo (context,Widget screen){
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}
void NavegatAndFinish (context,Widget screen){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => screen , ),(route)=>false);
}
Widget Button ({
  required String text,
  required VoidCallback function ,
}
    )=>
    Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        onPressed:function,
        child: Text(text , style: const TextStyle(color: Colors.white , fontSize: 18),),
      ),
    );
Widget TextFeild({
  required String labelText ,
  Icon? prefixIcon,
  IconButton? suffixIcon,
  FormFieldValidator<String>? validator,
  bool obscureText= false,
  TextEditingController? controller ,
  TextInputType? keyboardType,
  String? hintText,
  bool readOnly = false,
  ValueChanged<String>? onChanged,
  int? minline,
})=> TextFormField(
    minLines: minline,
    obscureText: obscureText ,
    keyboardType: keyboardType ,
    validator: validator,
    controller: controller,
    onChanged: onChanged,
    readOnly: readOnly,
    decoration: InputDecoration(
      
      hintText: hintText ,
      border: OutlineInputBorder(

        borderRadius: BorderRadius.circular(15),
      ),
      labelText:labelText ,

      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    )
);

Widget DoctorFormFiled ({
  required String  title ,
  required String hint ,
  TextEditingController? controller ,
  Widget? widget ,
  FormFieldValidator<String>? validator ,
  TextInputType? textInputType ,

}) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(title , style: const TextStyle( fontSize:  16 , fontWeight: FontWeight.w400 , color: Colors.black54),),
    const SizedBox(
      height: 8,
    ),
    Container(
      height: 52 ,
      padding:  const EdgeInsets.only(right: 14),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                validator: validator,
                readOnly: widget==null?false:true,
                autofocus: false,
                keyboardType: textInputType,
                cursorColor: Colors.grey[700],
               // controller: controller,
                style: TextStyle(
                  fontSize: 16 ,
                  fontWeight: FontWeight.w400 ,
                  color: Colors.grey[600],
                ),
                decoration: InputDecoration(
                  hintText: hint ,
                  hintStyle: TextStyle(
                    fontSize: 16 ,
                    fontWeight: FontWeight.w400 ,
                    color: Colors.grey[600],
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color:  Colors.white,
                      width: 0,
                    )
                  ) ,
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color:  Colors.white,
                        width: 0,

                      )
                  ) ,
                ),
              )
          ),
          widget == null?Container():Container(
            child: widget,
          )
        ],
      ),
    )
  ],
);
Future<void>ShowDialog({
  required context ,
  required Widget? title ,
  required List<Widget> actions ,
  required Widget? content,
  double? elevation ,
})=> showDialog(
  context: context,
  builder: (context) =>  Directionality(textDirection: TextDirection.rtl, child: AlertDialog(
    title: title,
    actions: actions,
    content: content,
    elevation: elevation,
  ),
  ),
  barrierDismissible: true ,
);
void showTost(@required String msg , @required Color msgColor)=> Fluttertoast.showToast(
    msg:  msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 4,
    backgroundColor: msgColor,
    textColor: Colors.white,
    fontSize: 16.0
);

getDateFromUser(context)async{
   DateTime? selectTime =  await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1930),
      lastDate: DateTime(2025),
  );
   if(selectTime==null){
     return 0 ;
   }
   return selectTime ;
}
getDateFromDoctorsUser(context)async{
  DateTime? selectTime =  await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2025),
  );
  if(selectTime==null){
    return null ;
  }
  return selectTime ;
}
getTimeFromUser(context)async{
   return await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 9, minute: 00),
     initialEntryMode: TimePickerEntryMode.input
  );
}

double random(int min, int max) {
  return min + Random().nextInt(max - min).toDouble();
}

Widget defBotton ({
  required String? text ,
  required VoidCallback? onPressed ,
  Color color = Colors.deepOrange,
})=>  Container(
  width: double.infinity,
  height: 50,
  decoration: BoxDecoration(
      color: color,

      borderRadius: BorderRadius.circular(12)
  ),
  child: MaterialButton(onPressed: onPressed ,child: Text('${text}' , style: TextStyle(
      fontSize: 20 ,
      color: Colors.white
  ),),),
);
