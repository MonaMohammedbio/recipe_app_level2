import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../models/ad.models.dart';

part 'ad_state.dart';

class AdCubit extends Cubit<List<Ad>> {
  AdCubit() : super([]);
  getAds()async{
    int x =0;
    final List<Ad>ads=[];
    final adsJson=jsonDecode(await rootBundle.loadString("Assets/data/sample.json"));
    for (var el in (adsJson as Iterable)){
      x++;
      ads.add(Ad.fromJason(el));
    }
    print("...now states will be emitted...");
    emit(ads);

  }
}
