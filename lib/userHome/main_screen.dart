import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vote_app/bloc_helper/home_bloc/home_cubit.dart';

import '../constant/constant.dart';
import '../models/userHome.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    cubit.representativeHome = representativeHomeCon ;
    return BlocConsumer<HomeCubit , HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {


        return  Scaffold(
            backgroundColor: Colors.white,
            body: ConditionalBuilder(
                condition: state is! HomeGetUserLoading,
                builder: (context) => cubit.screens[cubit.currentIndex],
                fallback: (context) => Center(child: CircularProgressIndicator(),),
            ),
            bottomNavigationBar: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 15),
                child: GNav(
                  selectedIndex: cubit.currentIndex,
                    gap: 8,
                    onTabChange: (index){
                      cubit.changeIndex(index);
                    },
                    backgroundColor: Colors.white,
                    color: Colors.deepOrange,
                    activeColor: Colors.deepOrange,
                    tabBackgroundColor: Colors.deepOrange.shade50,
                    tabs: [
                      GButton(icon: Icons.home , text: 'الرئيسية',),
                      GButton(icon: Icons.how_to_vote,text: 'تصوييت'),
                      GButton(icon: Icons.group , text: 'المصوتين',),
                    ]
                ),
              ),
            )
        );
      },
    );
  }
}
