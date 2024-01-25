import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:overlay_kit/overlay_kit.dart';

import '../models/recipes.models.dart';
import '../utils/toast_message_status.dart';
import '../widgets/toast_message.widgets.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {}, icon: FaIcon(FontAwesomeIcons.barsStaggered)),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none,
                      size: 30,
                    )),
              )
            ]),
        body: FutureBuilder(
            future: FirebaseFirestore.instance.collection('recipes').get(),
            builder: (ctx, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                if (snapShot.hasError) {
                  return const Text('error in get data');
                } else {
                  if (snapShot.hasData) {
                    if (snapShot.data?.docs.isNotEmpty ?? false) {
                      var recipesList = List<Recipe>.from(snapShot.data?.docs
                              .map((e) => Recipe.fromJson(e.data(), e.id)) ??
                          []);
                      return SafeArea(
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(children: [
                                Padding(
                                  padding: EdgeInsets.all(18.0),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Favorites",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      )),
                                ),
                                Row(children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: SizedBox(
                                      height: 40,
                                      width: 280,
                                      child: TextFormField(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide.none),
                                              prefixIcon: Icon(Icons.search),
                                              filled: true,
                                              labelText: 'Search for recipes',
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                  fontFamily: "Hellix"),
                                              fillColor: Colors.grey[200])),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 30),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                        height: 40,
                                        width: 50,
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: FaIcon(
                                              FontAwesomeIcons.sliders,
                                              color: Colors.black54,
                                            ))),
                                  )
                                ]),
                                ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: recipesList.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                          // elevation: 1,
                                          child: Row(children: [
                                        Image.network(
                                            width: 150,
                                            height: 70,
                                            jsonEncode(recipesList[index]
                                                    .imageUrl) ??
                                                'no image found'),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                jsonEncode(recipesList[index]
                                                        .type) ??
                                                    'no type found',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.cyan[600]),
                                              ),
                                              Text(
                                                  jsonEncode(recipesList[index]
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
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    jsonEncode(
                                                            recipesList[index]
                                                                .calories) ??
                                                        'no data found',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.deepOrange,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(Icons.access_time,
                                                            size: 15,
                                                            color: Colors.grey),
                                                        Text(
                                                          jsonEncode(recipesList[
                                                                      index]
                                                                  .total_time) ??
                                                              'no time found',
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
                                                          Icons
                                                              .room_service_outlined,
                                                          size: 15,
                                                          color: Colors.grey,
                                                        ),
                                                        Text(
                                                          '${jsonEncode(recipesList[index].servings) ?? 'no data found'}serving',
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ]),
                                            ]),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                50, 0, 0, 50),
                                            child: IconButton(
                                              onPressed: () {
                                                jsonEncode(addFavoriteToUser);
                                              },
                                              icon:
                                                  Icon(FontAwesomeIcons.heart),
                                            )
                                            // FontAwesomeIcons.heart,textDirection: TextDirection.rtl),
                                            ),
                                      ]));
                                    })
                              ])));
                    } else {
                      return const Text('No Data Found');
                    }
                  } else {
                    return const Text('No Data Found');
                  }
                }
              }
            }));
  }
}

Future<void> addFavoriteToUser(String favoriteId, bool isAdd) async {
  try {
    OverlayLoadingProgress.start();
    if (isAdd) {
      await FirebaseFirestore.instance
          .collection('recipes')
          .doc(favoriteId)
          .update({
        "favorite_user_ids":
            FieldValue.arrayUnion([FirebaseAuth.instance.currentUser?.uid])
      });
    } else {
      await FirebaseFirestore.instance
          .collection('recipes')
          .doc(favoriteId)
          .update({
        "favorite_user_ids":
            FieldValue.arrayRemove([FirebaseAuth.instance.currentUser?.uid])
      });
    }
    OverlayLoadingProgress.stop();
  } catch (e) {
    OverlayLoadingProgress.stop();
    OverlayToastMessage.show(
      widget: ToastMessageWidget(
        message: 'Error : ${e.toString()}',
        toastMessageStatus: ToastMessageStatus.failed,
      ),
    );
  }
}
