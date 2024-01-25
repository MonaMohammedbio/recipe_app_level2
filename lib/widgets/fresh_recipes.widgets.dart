import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/recipes.models.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  // List freshRecipes = [
  //   {
  //     "image":"images/freshtoast.png",
  //     "name": "Frensh Toast with Berries",
  //     "calories": "120 Calories",
  //     "time": "10 min",
  //     "serving": "1 Serving",
  //
  //   },
  //   {
  //     "image": "images/Cinnamon Toaast.png",
  //     "name": "Brown Sugar Cinnamon Toast",
  //     "calories": "135 Calories",
  //     "time": "15 min",
  //     "serving": "1 Serving"
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('recipes')
            .get(),
        builder: (ctx, snapShot) {
          if (snapShot.connectionState ==
              ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapShot.hasError) {
              return const Text('error in get data');
            } else {
              if (snapShot.hasData) {
                if (snapShot.data?.docs.isNotEmpty ?? false) {
                  var recipesList = List<Recipe>.from(
                      snapShot.data?.docs.map((e) =>
                          Recipe.fromJson(e.data(), e.id)) ??
                          []);
return ListView.builder(
    addRepaintBoundaries: true,
    scrollDirection: Axis.horizontal,
    primary: true,
    shrinkWrap: true,
    itemCount: recipesList.length,
    itemBuilder: (context, index) {
      return Card(
          borderOnForeground: true,
          margin: EdgeInsets.only(right: 30),
          //elevation: 2,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(FontAwesomeIcons.heart),
                Transform.translate(offset:Offset(50,0),child: Image.network(width:150,height:70,jsonEncode(recipesList[index]
                    .imageUrl) ??
                    'no image found')),
                Text(
                  jsonEncode(recipesList[index]
                      .type) ??
                      'no type found',
                  style: TextStyle(fontSize:12,color: Colors.cyan[600]),
                ),
                Text(jsonEncode(recipesList[index]
                    .title) ??
                    'no title found',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Hellix",
                        fontSize: 15)),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.deepOrange,
                    ),
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.deepOrange,
                    ),
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.deepOrange,
                    ),
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.deepOrange,
                    ),
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.deepOrange,
                    ),
                  ],
                ),
                Text(
                  jsonEncode(recipesList[index]
                      .calories) ??
                      'no data found',
                  style:
                  TextStyle(color: Colors.deepOrange, fontSize: 12),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time,
                              size: 15, color: Colors.grey),
                          Text(
                            jsonEncode(recipesList[index]
                                .total_time) ??
                                'no time found',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 30,),
                      Row(
                        children: [
                          Icon(
                            Icons.room_service_outlined,
                            size: 15,
                            color: Colors.grey,
                          ),

                          Text(
                           '${ jsonEncode(recipesList[index]
                                .servings) ??
                                'no data found'}serving',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ]),
              ]));


    });
                } else {
                  return const Text('No Data Found');
                }
              } else {
                return const Text('No Data Found');
              }
            }
          }
        });

  }
}
