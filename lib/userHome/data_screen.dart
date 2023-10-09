import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vote_app/bloc_helper/home_bloc/home_cubit.dart';

import '../component/component.dart';
import '../exeal_helper/ex_helper.dart';
import '../models/all_voter.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit.get(context).getAllVoter(HomeCubit.get(context).representativeHome!.data![0].representativeBox!);
    return BlocConsumer<HomeCubit , HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return ConditionalBuilder(
            condition: cubit.allVoter?.data!=null,
            builder: (context) => SafeArea(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("المصوتين"  ,style:  TextStyle(fontWeight: FontWeight.bold , fontSize: 30 , color: Colors.deepOrange),),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: ()async{
                                  PermissionStatus storeg = await Permission.manageExternalStorage.request();
                                  if(storeg == PermissionStatus.granted){
                                    await createExel(cubit.allVoter!.data! , cubit.representativeHome!.data![0].representativeBox!);
                                  }else {
                                    showTost("يجب الموافقة على الأذونات للحصول على الخدمة ! ", Colors.red);
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 12,horizontal: 25),
                                  decoration: BoxDecoration(
                                      color:Colors.green,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'مشاهدة بملف Exeal',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color:  Colors.white
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Icon(Icons.folder , color: Colors.white,)
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => AllVoterBuilder(cubit.allVoter!.data![index]!),
                            separatorBuilder: (context, index) => Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 4,
                                  width: random(150 , 300),
                                  color: Colors.amber,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            itemCount: cubit.allVoter!.data!.length
                        ),
                      ],
                    ),
                  ),
                )
            ),
            fallback: (context) => Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}
Widget AllVoterBuilder (Data modul)=>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              spreadRadius: 4)
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${modul.id}"),
            Text("${modul.fName} ${modul.sName} ${modul.tName} ${modul.lName}" , style: TextStyle(color:  Colors.deepOrange , fontWeight: FontWeight.bold),),
            modul.state==0?
                Text("لم يتم التصويت" , style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold),):
                Text("تم التصويت" , style: TextStyle(color: Colors.green , fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );