import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vote_app/bloc_helper/home_bloc/home_cubit.dart';

import '../constant/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit , HomeState>(
      listener: (context, state) {
        if(state is HomeGetUserSucc){
          HomeCubit.get(context).representativeHome = representativeHomeCon ;
        }
      },
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 190,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            child: Container(
                              height: 140,
                              alignment: AlignmentDirectional.topCenter,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://www.universityofcalifornia.edu/sites/default/files/styles/feature_banner_image/public/2022-09/gotv-vote-2022-banner.png?h=a35cede2&itok=HXkg3srD'),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          CircleAvatar(
                            radius: 64,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                  'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1675239832~exp=1675240432~hmac=003a3e6ace65a5ea1c9fc68664def6697f3bbcbb4a0d2e5b44ed1e32ac6f80c0'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${cubit.representativeHome!.data![0].representativeFName} ${cubit.representativeHome!.data![0].representativeTName}' ,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text('عدد المصوتين' , style: TextStyle(color: Colors.deepOrange , fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.deepOrange,
                      child: Text('${cubit.representativeHome!.data![0].representativeVoted}' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 20),),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        'معلومات مندوب الصندوق' ,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
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
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(Icons.person , color: Colors.deepOrange,),
                            SizedBox(width: 5,),
                            Text("الأسم :-" , style: TextStyle(color: Colors.deepOrange , fontWeight: FontWeight.bold),),
                            SizedBox(width: 5,),
                            Expanded(child: Text("${cubit.representativeHome!.data![0].representativeFName} ${cubit.representativeHome!.data![0].representativeSName} ${cubit.representativeHome!.data![0].representativeTName}" , style: TextStyle(color: Colors.deepOrange), maxLines: 1 , overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(Icons.phone , color: Colors.deepOrange,),
                            SizedBox(width: 5,),
                            Text("رقم الهاتف : -" , style: TextStyle(color: Colors.deepOrange , fontWeight: FontWeight.bold),),
                            SizedBox(width: 5,),
                            Expanded(child: Text("${cubit.representativeHome!.data![0].representativePhoneNumber}" , style: TextStyle(color: Colors.deepOrange), maxLines: 1 , overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(Icons.indeterminate_check_box_rounded , color: Colors.deepOrange,),
                            SizedBox(width: 5,),
                            Text("رقم الصندوق :-" , style: TextStyle(color: Colors.deepOrange ,fontWeight: FontWeight.bold),),
                            SizedBox(width: 5,),
                            Expanded(child: Text("${cubit.representativeHome!.data![0].representativeBox}" , style: TextStyle(color: Colors.deepOrange), maxLines: 1 , overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.business_sharp , color: Colors.deepOrange,),
                            SizedBox(width: 5,),
                            Text("مكان الصندوق :-" , style: TextStyle(color: Colors.deepOrange ,fontWeight: FontWeight.bold),),
                            SizedBox(width: 5,),
                            Expanded(child: Text("${cubit.representativeHome!.data![0].representativeLocation}" , style: TextStyle(color: Colors.deepOrange), maxLines: 1 , overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(Icons.location_on , color: Colors.deepOrange,),
                            SizedBox(width: 5,),
                            Text(" المحافظة :-" , style: TextStyle(color: Colors.deepOrange ,fontWeight: FontWeight.bold),),
                            SizedBox(width: 5,),
                            Expanded(child: Text("${cubit.representativeHome!.data![0].representativeGovernorate}" , style: TextStyle(color: Colors.deepOrange), maxLines: 1 , overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.star , color: Colors.deepOrange,),
                            SizedBox(width: 5,),
                            Text(" المرشح :-" , style: TextStyle(color: Colors.deepOrange ,fontWeight: FontWeight.bold),),
                            SizedBox(width: 5,),
                            Expanded(child: Text("${cubit.representativeHome!.data![0].candidate![0].candidateFName} ${cubit.representativeHome!.data![0].candidate![0].candidateSName} ${cubit.representativeHome!.data![0].candidate![0].candidateTName} ${cubit.representativeHome!.data![0].candidate![0].candidateLName}" , style: TextStyle(color: Colors.deepOrange), maxLines: 1 , overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}
