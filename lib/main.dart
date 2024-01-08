import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app_level2/cubit/ad_cubit.dart';
import 'package:recipe_app_level2/pages/Splash.pages.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'models/ad.models.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    var prefrence = await SharedPreferences.getInstance();
    GetIt.I.registerSingleton<SharedPreferences>(prefrence);
    // if (PrefrencesService.prefs != null) {
    //   print(
    //       '========================= prefrences init Successfully ========================');
    // }
  } catch (e) {
    print(
        '=========================Error In init Prefrences ${e}========================');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:
      MultiBlocProvider(
        providers: [
          BlocProvider<AdCubit>(
            create: (BuildContext context) {
              AdCubit adCubit=AdCubit();
              if (adCubit.state.isEmpty){
                AdCubit.getAds();
    }else{
                print("....states are not empty");
    }
      return AdCubit();
    }),
          BlocProvider<AdCubit>(
            create: (BuildContext context) => AdCubit(),
          ),
        ],
        child: Scaffold(body:BlocBuilder<AdCubit,List<Ad>>(
          builder:(context,state){
    if (state.isNotEmpty){
    print("....loaded.....");
    return const Center(child: Text('Loaded'),);
    }else if (state.isEmpty){
    print("..loading...");
    return const Center(child: Text("loading..."),);

    }
    print("..uI is being called...");
    return


    SplashPage();
    }))
      ),
    );
  }
}
