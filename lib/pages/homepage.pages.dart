
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_level2/pages/favorites.pages.dart';

import 'package:recipe_app_level2/provider/app_auth.provider.dart';
import 'package:recipe_app_level2/widgets/fresh_recipes.widgets.dart';
import 'package:recipe_app_level2/widgets/recommended.widgets.dart';

import '../models/recipes.models.dart';
import '../provider/recipes.provider.dart';
import '../widgets/ads_widgets.dart';
import 'ingredients.pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// int sliderIndex = 0;
//   CarouselController carouselControllerEx = CarouselController();
//   List<Ad> adsList = [];
//
//   void getAds() async {
//     var adsData = await rootBundle.loadString('Assets/data/sample.json');
//     var dataDecoded =
//         List<Map<String, dynamic>>.from(jsonDecode(adsData)["ads"]);
//     adsList = dataDecoded.map((e) => Ad.fromJason(e)).toList();
//     print(adsList);
//     setState(() {});
//   }
//
//   @override
//   void initState(){
//     super.initState();
//
//   }
  late ZoomDrawerController?controller;

  @override
  void initState() {
    controller= ZoomDrawerController();
    Provider.of<RecipesProvider>(context, listen: false).getRecipes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

   return  ZoomDrawer(
     menuBackgroundColor: Colors.white,
     disableDragGesture: true,
     mainScreenTapClose: true,
      controller: controller,
      menuScreen: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                onTap: () {
                  controller?.close?.call();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => FavoritePage()));
                },
                leading: Icon(Icons.favorite_outline_rounded),
                title: Text('Favorites')),
              ListTile(
                onTap: () {
                  controller?.close?.call();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => IngredientPage()));
                },
                leading: Icon(Icons.food_bank),
                title: Text('Ingredients'),
              ),
              ListTile(
                onTap: () {
                  Provider.of<AppAuthProvider>(context, listen: false)
                      .signOut(context);
                },
                leading: Icon(Icons.logout),
                title: Text('Sign Out'),

              ),

            ],
          ),
        ),
      ),
      mainScreen: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  controller!.toggle!();
                },

                icon: FaIcon(FontAwesomeIcons.barsStaggered)),
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
        body: SafeArea(

            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:
                Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Bonjour,${FirebaseAuth.instance.currentUser?.displayName??"no name"}",
                              style: TextStyle(color: Colors.grey, fontSize: 16),
                            )),
                      ),
                      Text(
                        "What would you like to cook today?",
                        style: TextStyle(
                            fontFamily: "LibreBaskerville",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 18),
                            child: SizedBox(
                              height: 40,
                              width: 280,
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
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
                            padding: EdgeInsets.only(left: 10),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: AlignmentDirectional.centerStart,
                                height: 40,
                                width: 50,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: FaIcon(
                                      FontAwesomeIcons.sliders,
                                      color: Colors.black54,
                                    ))),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text("Today's Fresh Recipes",
                                style: TextStyle(
                                    fontFamily: "Hellix",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 75),
                            child: TextButton(
                                onPressed: () {},
                                child: Text("See All",
                                    style: TextStyle(
                                        fontFamily: "Hellix",
                                        fontSize: 15,
                                        color: Colors.deepOrange))),
                          )
                        ],
                      ),

                      AdsWidget(),

                      Container(
                        width: 360,
                        height: 200,

                        child: Recipes( ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:20),
                            child: Text("Recommended",
                                style: TextStyle(
                                    fontFamily: "Hellix",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 110),
                            child: TextButton(
                                onPressed: () {},
                                child: Text("See All",
                                    style: TextStyle(
                                        fontFamily: "Hellix",
                                        fontSize: 15,
                                        color: Colors.deepOrange))),
                          )
                        ],
                      ),

                      Container(
                        width: 360,
                        height: 200,
                        child: Recommendedrecipes(),
                      ),
                      ElevatedButton(onPressed: (){

                        Provider.of <AppAuthProvider>(context,listen: false).signOut(context);
                      }, child: Text("SignOut",style:TextStyle(color:Colors.deepOrange))),
                      // ElevatedButton(
                      //     onPressed: () async {
                      //       OverlayLoadingProgress.start();
                      //
                      //       await FirebaseFirestore.instance
                      //           .collection('ads')
                      //           .doc("custiom id")
                      //           .set({
                      //         "title": "Less Carbs Meals",
                      //         "image":
                      //         "https://www.eatingwell.com/thmb/OAYhGtEKJmD7HW0Azd6uZCxVIiA=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/cheesy-portobello-chicken-cutlets-with-broccoli-ae1449c758834bb7ac75437e37a14065.jpg"
                      //       });
                      //
                      //       OverlayLoadingProgress.stop();
                      //     },
                      //     child: Text('add')),

                    ])
            )

        ),
      ),
      borderRadius:5.0,
      showShadow: true,
      angle: -12.0,
      drawerShadowsBackgroundColor: Colors.grey.shade300,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );


  }
}
