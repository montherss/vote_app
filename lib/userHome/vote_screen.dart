


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vote_app/bloc_helper/home_bloc/home_cubit.dart';
import 'package:vote_app/component/component.dart';

class VoteScreen extends StatelessWidget {
  const VoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var FormKey = GlobalKey<FormState>();
    var ssnController = TextEditingController();
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context, state) {
        if(state is HomeGetVoterSucc){
          if(state.voter.status=="success"){
            showTost("تم !", Colors.green);
          }else {
            showTost(state.voter.message!, Colors.red);
          }
        }
        else if (state is HomeGetVoterError){
          showTost(state.Error, Colors.red);
        }
        else if (state is HomeVoteNowSucc){
          if(state.respons.status=="success"){
            showTost(state.respons.message!, Colors.green);
            HomeCubit.get(context).changeIndex(0);
          }
          else {
            showTost(state.respons.message!,Colors.red);
          }
        }
        else if (state is HomeVoteNowError){
          showTost(state.Error, Colors.red);
        }
      },
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("التصوييت"  ,style:  TextStyle(fontWeight: FontWeight.bold , fontSize: 30 , color: Colors.deepOrange),),
                    ],
                  ) ,
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                      key: FormKey,
                      child: Expanded(
                        child: Column(
                          children: [
                            TextFeild(
                                labelText: "رقم المواطن" ,
                                keyboardType: TextInputType.number,
                                controller: ssnController,
                                prefixIcon: Icon(Icons.person , color: Colors.deepOrange,),
                                onChanged: (value){
                                  if(value.isEmpty){
                                    cubit.clearVoter();
                                  }
                                },
                                validator: (value){
                                  if(value==null||value.isEmpty){
                                    return "الرجاء ادخال رقم المواطن للتصويت !";
                                  }
                                  return null;
                                }
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            if(cubit.voter?.data!=null)
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white ,
                                  boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 6,
                                          spreadRadius: 4)
                                    ],
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${cubit.voter!.data![0].fName} ${cubit.voter!.data![0].sName} ${cubit.voter!.data![0].tName} ${cubit.voter!.data![0].lName}" , style:  TextStyle(fontWeight: FontWeight.bold , fontSize: 15 , color: Colors.deepOrange),),
                                      cubit.voter!.data![0].state==0?
                                          Text("لم يصوت بعد" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15 , color: Colors.green),):
                                          Text("تم التصويت" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15 , color: Colors.red),),
                                    ],
                                  ),
                                ),
                              ),
                            Spacer(),
                              ConditionalBuilder(
                                condition: state is! HomeGetVoterLoading,
                                builder: (context) =>  cubit.voter?.data ==null && ssnController.text.isEmpty?defBotton(
                                    text: "بحث", onPressed: (){
                                  if(FormKey.currentState!.validate()){
                                    cubit.getVoter(ssnController.text, cubit.representativeHome!.data![0].representativeBox!);
                                    FocusScope.of(context).unfocus();
                                  }
                                }
                                ) : cubit.voter?.data?[0].state==0 ? defBotton(
                                    text: "تصوييت", color: Colors.green,onPressed: (){
                                      ShowDialog(
                                          context: context,
                                          title: Text("هل انت متأكد ؟"),
                                          actions: [
                                            TextButton(onPressed: (){
                                              cubit.voteNow(cubit.representativeHome!.data![0].representativeId.toString(), ssnController.text,cubit.representativeHome!.data![0].representativeBox! );
                                              Navigator.pop(context);
                                            }, child: Text("نعم")),
                                            TextButton(onPressed: (){
                                              Navigator.pop(context);
                                            }, child: Text("لا")),
                                          ],
                                          content: Text("هل انت متأكد للتصويت ؟")
                                      );
                                    FocusScope.of(context).unfocus();
                                  }

                                ) : defBotton(
                                    text: "لا يمكن التصويت !", color: Colors.red ,onPressed: (){
                                }
                                ),
                                fallback: (context) => Center(child: CircularProgressIndicator(),),
                            )
                          ],
                        ),
                      )
                  )
                ],
              ),
            )
        );
      },
    );
  }
}
