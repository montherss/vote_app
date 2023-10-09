import 'dart:convert';

import '../models/userHome.dart';

RepresentativeHome? representativeHomeCon ;

String SERVER = "https://myclinicjo.net/vote_backend";
String AUTH = "$SERVER/auth";
String VOTE = "$SERVER/vote";
//=========================================Login========================================//
String LOGIN = "$AUTH/login.php";
String LOGINBYID = "$AUTH/getUserByID.php";
String _basicAuth = 'Basic ' +
    base64Encode(utf8.encode("Almontherss41@:Almontherss41@!"));
Map<String,String>myheaders = {
  'authorization':_basicAuth
};
//=========================================Vote========================================//
String GET_ALLVOTER = "$VOTE/getAllVoter.php";
String GET_VOTER = "$VOTE/getVoter.php";
String VOTE_NOW = "$VOTE/voteNow.php";