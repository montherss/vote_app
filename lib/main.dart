import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vote_app/Crud/crud.dart';
import 'package:vote_app/bloc_helper/home_bloc/home_cubit.dart';
import 'package:vote_app/bloc_helper/login_bloc/login_cubit.dart';
import 'package:vote_app/component/component.dart';
import 'package:vote_app/splash_screen.dart';
import 'package:vote_app/userHome/main_screen.dart';

import 'constant/constant.dart';
import 'local/cache_helper.dart';
import 'login/login_screen.dart';
import 'models/userHome.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHepler.init();
  var id = CacheHepler.getData(key: "id");
  Widget firstScreen = LoginScreen() ;
  if(id!=null){
    await Crud.postData(linkUrl: LOGINBYID, data: {
      "user_id":id ,
    }).then((value){
      representativeHomeCon = RepresentativeHome.fromJson(value);
      firstScreen = MainScreen();
    }).catchError((onError){
      showTost(onError, Colors.red);
    });
  }else {
    firstScreen = LoginScreen();
  }
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.deepOrange,
      statusBarIconBrightness: Brightness.light

  ));
  runApp(MyApp(firstScreen));
}

class MyApp extends StatelessWidget {
  final Widget firstScreens ;
  MyApp(this.firstScreens);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context)=>  HomeCubit()),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,

            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  elevation: 0 ,

                  systemOverlayStyle: SystemUiOverlayStyle(
                  // Status bar color
                  statusBarColor: Colors.red,
                  // Status bar brightness (optional)
                  statusBarIconBrightness: Brightness.light, // For Android (dark icons)
                  statusBarBrightness: Brightness.light, // For iOS (dark icons)
                ),
              ),
              fontFamily: 'jannah',
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
              useMaterial3: true,
            ),
            home: Directionality(textDirection: TextDirection.rtl , child: SplashScreen(firstScreen: firstScreens),)
        ),
    );
  }
}
