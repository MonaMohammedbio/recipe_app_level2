import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_level2/provider/Ads.provider.dart';
import 'package:recipe_app_level2/widgets/fresh_recipes.widgets.dart';
import 'package:recipe_app_level2/widgets/recommended.widgets.dart';

import '../models/ad.models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int sliderIndex = 0;
  CarouselController carouselControllerEx = CarouselController();
  // List<Ad> adsList = [];
  //
  // void getAds() async {
  //   var adsData = await rootBundle.loadString('Assets/data/sample.json');
  //   var dataDecoded =
  //       List<Map<String, dynamic>>.from(jsonDecode(adsData)["ads"]);
  //   adsList = dataDecoded.map((e) => Ad.fromJason(e)).toList();
  //   print(adsList);
  //   setState(() {});
  // }

  @override
  void initState() {
    // getAds();
   Provider.of<AdsProvider>(context,listen: false).getAds();
    super.initState();

  }

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
        body: SafeArea(

          child: SingleChildScrollView(
              //scrollDirection: Axis.vertical,
             child: Consumer<AdsProvider>(builder: (context,value,child){

                return Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Bonjour,Emma",
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
                            padding: EdgeInsets.only(left: 30),
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
                            padding: const EdgeInsets.only(left: 90),
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
                      CarouselSlider(
                        carouselController: carouselControllerEx,
                        options: CarouselOptions(
                            height: 200.0,
                            autoPlay: true,
                            viewportFraction: 0.75,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            onPageChanged: (index, _) {
                              sliderIndex = index;
                              setState(() {});
                            },
                            enlargeStrategy: CenterPageEnlargeStrategy.height),
                        items: value.adsList.map((ads) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(ads.image.toString()))),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                  child: Text(
                                      style: TextStyle(
                                          backgroundColor: Colors.black38,
                                          color: Colors.white),
                                      ads.title.toString())),
                            ),
                          );
                        }).toList(),
                      ),
                      Row(
                        verticalDirection: VerticalDirection.up,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () async {
                                await carouselControllerEx.nextPage();
                              },
                              icon: Icon(Icons.arrow_back_ios)),
                          IconButton(
                              onPressed: () async {
                                await carouselControllerEx.previousPage();
                              },
                              icon: Icon(Icons.arrow_forward_ios))

                        ],
                      ),

                      DotsIndicator(
                        dotsCount: (value.adsList?.length ?? 0) > 0 ? value.adsList.length : 1,
                        position: sliderIndex,
                        onTap: (position) async {
                          await carouselControllerEx.animateToPage(position);
                          sliderIndex = position;
                          setState(() {});
                        },
                        decorator: DotsDecorator(
                          activeColor: Colors.deepOrange,
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),


                      Container(
                        width: 360,
                        height: 200,
                        child: Recipes(),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text("Recommended",
                                style: TextStyle(
                                    fontFamily: "Hellix",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 150),
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
                      )
                    ]);
              })

    ),
        )
  );
  }
}
