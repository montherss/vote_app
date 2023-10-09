import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constant/constant.dart';

class Crud {
  static Future<Map> postData({
    required String linkUrl ,
    required Map data
  })async{
    try{
      var client = http.Client();
      Uri url = Uri.parse(linkUrl);
      http.Response res = await client.post(url ,headers: myheaders, body:data);
      if(res.statusCode == 200 || res.statusCode == 201){
        Map resBody =jsonDecode(res.body);
        return resBody ;
      }else{
        throw("ERROR REQ");
      }
    }catch(e){
      throw(e.toString());
    }
  }
}