import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:vote_app/Crud/crud.dart';
import 'package:vote_app/models/all_voter.dart';
import 'package:vote_app/models/respons.dart';
import 'package:vote_app/models/voter.dart';

import '../../constant/constant.dart';
import '../../models/userHome.dart';
import '../../userHome/data_screen.dart';
import '../../userHome/home_screen.dart';
import '../../userHome/vote_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context)=>BlocProvider.of(context);
  int currentIndex = 0 ;
  void changeIndex(int index){
    currentIndex = index;
    if(currentIndex == 0 || currentIndex == 1 || currentIndex == 2){
      clearVoter();
      getUserById(representativeHome!.data![0].representativeId.toString());
    }
    emit(HomeChangeHomeIndex());
  }
  List<Widget> screens = [
    HomeScreen(),
    VoteScreen(),
    DataScreen(),
  ];
  RepresentativeHome? representativeHome ;

  void getUserById(String id)async{
    emit(HomeGetUserLoading());
    await Crud.postData(linkUrl: LOGINBYID, data: {
      "user_id":id,
    }).then((value){
      representativeHomeCon = RepresentativeHome.fromJson(value);
      emit(HomeGetUserSucc(representativeHomeCon!));
    }).catchError((onError){
      emit(HomeGetUserError(onError.toString()));
    });
  }

  Voter? voter;
  void getVoter(String voter_id , String box)async{
    emit(HomeGetVoterLoading());
    await Crud.postData(linkUrl: GET_VOTER, data: {
      "voter_id":voter_id,
      "box":"box$box",
    }).then((value){
      voter = Voter.fromJson(value);
      emit(HomeGetVoterSucc(voter!));
    }).catchError((onError){
      emit(HomeGetVoterError(onError.toString()));
    });
  }

  void clearVoter (){
    voter = null ;
    emit(HomeClearVoterLoading());
  }

  Respons? respons;
  void voteNow (String representative_id , String voter_id , String box)async{
    emit(HomeVoteNowLoading());
    await Crud.postData(linkUrl: VOTE_NOW, data: {
      "voter_id": voter_id,
      "representative_id" : representative_id,
      "box":"box$box",
    }).then((value){
      respons = Respons.fromJson(value);
      emit(HomeVoteNowSucc(respons!));
    }).catchError((onError){
      emit(HomeVoteNowError(onError.toString()));
    });
  }

  AllVoter? allVoter ;
  void getAllVoter(String box)async{
    emit(HomeGetAllVoterLoading());
    await Crud.postData(linkUrl: GET_ALLVOTER, data: {
      "box":"box$box",
    }).then((value){
      allVoter = AllVoter.fromJson(value);
      emit(HomeGetAllVoterSucc(allVoter!));
    }).catchError((onError){
      emit(HomeGetAllVoterError(onError.toString()));
    });
  }
}
