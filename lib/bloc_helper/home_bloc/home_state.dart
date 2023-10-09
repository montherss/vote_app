part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
//==================================Change Home Index ====================================//
class HomeChangeHomeIndex extends HomeState {}
//==================================Change Home Index ====================================//
//================================LoginUser=================================//
class HomeGetUserSucc extends HomeState {
  final RepresentativeHome userHome;
  HomeGetUserSucc(this.userHome);
}
class HomeGetUserLoading extends HomeState {}
class HomeGetUserError extends HomeState {
  final String Error ;
  HomeGetUserError(this.Error);
}
//================================LoginUser=================================//

//================================GetVoter=================================//
class HomeGetVoterSucc extends HomeState {
  final Voter voter;
  HomeGetVoterSucc(this.voter);
}
class HomeGetVoterLoading extends HomeState {}
class HomeGetVoterError extends HomeState {
  final String Error ;
  HomeGetVoterError(this.Error);
}
//================================GetVoter=================================//

//================================ClearVoter=================================//
class HomeClearVoterLoading extends HomeState {}
//================================VoteNow=================================//
class HomeVoteNowSucc extends HomeState {
  final Respons respons;
  HomeVoteNowSucc(this.respons);
}
class HomeVoteNowLoading extends HomeState {}
class HomeVoteNowError extends HomeState {
  final String Error ;
  HomeVoteNowError(this.Error);
}
//================================VoteNow=================================//
//================================Get All Voter=================================//
class HomeGetAllVoterSucc extends HomeState {
  final AllVoter  voter;
  HomeGetAllVoterSucc(this.voter);
}
class HomeGetAllVoterLoading extends HomeState {}
class HomeGetAllVoterError extends HomeState {
  final String Error ;
  HomeGetAllVoterError(this.Error);
}
//================================Get All Voter=================================//