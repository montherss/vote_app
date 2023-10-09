
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:vote_app/Crud/crud.dart';

import '../../constant/constant.dart';
import '../../models/userHome.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context)=>BlocProvider.of(context);
  bool obs = true ;
  RepresentativeHome? representativeHome;
  void obsChange (bool change){
    obs =! change ;
    emit(LoginChangeObs());
  }

  void loginUser (String phoneNumber , String password)async{
    emit(LoginUserLoading());
    await Crud.postData(linkUrl: LOGIN, data: {
      "user_phoneNumber":phoneNumber,
      "user_password":password,
    }).then((value){
      representativeHomeCon = RepresentativeHome.fromJson(value);
      emit(LoginUserSucc(representativeHomeCon!));
    }).catchError((onError){
      emit(LoginUserError(onError.toString()));
    });
  }
}
