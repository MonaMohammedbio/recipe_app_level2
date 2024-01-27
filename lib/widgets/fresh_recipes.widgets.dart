import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../provider/recipes.provider.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesProvider>(
        builder: (ctx, recipeProvider, _) => recipeProvider.recipesList == null
            ? const CircularProgressIndicator()
            : (recipeProvider.recipesList?.isEmpty ?? false)
                ? const Text('No Data Found')
                : ListView.builder(
                    addRepaintBoundaries: true,
                    scrollDirection: Axis.horizontal,
                    primary: true,
                    shrinkWrap: true,
                    itemCount: recipeProvider.recipesList!.length,
                    itemBuilder: (context, index) {
                      return Card(
                          borderOnForeground: true,
                          margin: EdgeInsets.only(right: 30),
                          //elevation: 2,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(onTap:(){
                                  recipeProvider.addRecipeToUserFavourite(
                                      recipeProvider.recipesList![index].docId!,
                                      !(recipeProvider.recipesList![index].favorite_user_ids?.contains(FirebaseAuth.instance.currentUser?.uid)
                                          ?? false));
                                },child: Icon(FontAwesomeIcons.heart)),
                                Transform.translate(
                                    offset: Offset(50, 0),
                                    child: Image.network(
                                        width: 150,
                                        height: 70,
                                        "${recipeProvider.recipesList![index].imageUrl ?? "no image found"}")),
                                Text(
                                  recipeProvider.recipesList![index].type ??
                                      'No type found',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.cyan[600]),
                                ),
                                Text(
                                    recipeProvider.recipesList![index].title ??
                                        "No title found",
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
                                  "${recipeProvider.recipesList![index].calories ?? 'No calories found'}calories",
                                  style: TextStyle(
                                      color: Colors.deepOrange, fontSize: 12),
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.access_time,
                                              size: 15, color: Colors.grey),
                                          Text(
                                            '${recipeProvider.recipesList![index].total_time ?? 'no data found'}',
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.room_service_outlined,
                                            size: 15,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            '${recipeProvider.recipesList![index].servings ?? 'no data found'}serving',
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                              ]));
                    }));
  }
}
