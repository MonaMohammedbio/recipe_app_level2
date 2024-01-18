
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../models/ad.models.dart';
//
// class AdsProvider extends ChangeNotifier {
//  List<Ad> adsList = [];
//
//  Future<void> getAds() async {
//   Future<void> getAds() async {
//    var adsData = await rootBundle.loadString('Assets/data/sample.json');
//    var dataDecoded = List<Map<String, dynamic>>.from(
//        jsonDecode(adsData)["ads"]);
//    adsList = dataDecoded.map((e) => Ad.fromJason(e)).toList();
//    notifyListeners();
//   }
//  }
// }