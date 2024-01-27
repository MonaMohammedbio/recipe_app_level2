import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:recipe_app_level2/models/recipes.models.dart';


import '../utils/toast_message_status.dart';
import '../widgets/toast_message.widgets.dart';





class RecipesProvider extends ChangeNotifier {
  List<Recipe>? _recipesList;

  List<Recipe>? get recipesList => _recipesList;

  Future<void> getRecipes() async {
    try {
      var result =
      await FirebaseFirestore.instance.collection('recipes').get();

      if (result.docs.isNotEmpty) {
        _recipesList = List<Recipe>.from(
            result.docs.map((doc) => Recipe.fromJson(doc.data(), doc.id)));

      } else {
        _recipesList = [];
      }
      notifyListeners();
    } catch (e) {
      _recipesList = [];
      notifyListeners();
    }
  }

  Future<void>addRecipeToUserFavourite (String recipeId, bool isAdd) async {

    try {
      OverlayLoadingProgress.start();
      if (isAdd) {
        await FirebaseFirestore.instance
            .collection('recipes')
            .doc(recipeId)
            .update({
          "favorite_user_ids":
          FieldValue.arrayUnion([FirebaseAuth.instance.currentUser?.uid])
        });
      } else {
        await FirebaseFirestore.instance
            .collection('recipes')
            .doc(recipeId)
            .update({
          "favorite_user_ids":
          FieldValue.arrayRemove([FirebaseAuth.instance.currentUser?.uid])
        });
      }
      OverlayLoadingProgress.stop();
      getRecipes();
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

}