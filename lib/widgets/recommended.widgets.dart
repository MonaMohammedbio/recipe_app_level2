import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Recommendedrecipes extends StatefulWidget {
  const Recommendedrecipes({super.key});

  @override
  State<Recommendedrecipes> createState() => _RecommendedrecipesState();
}

class _RecommendedrecipesState extends State<Recommendedrecipes> {
  List recommendedRecipes = [
    {
      "image": "images/Muffins.png",
      "name": "Blueberry Muffins",
      "calories": "120 Calories",
      "time": "10 min",
      "serving": "1 Serving"
    },
    {
      "image": "images/GlazedSalmon.png",
      "name": "Glazed Salmon",
      "calories": "280 Calories",
      "time": "45 min",
      "serving": "1 Serving"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(

          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: recommendedRecipes.length,
          itemBuilder: (context, index) {
            return Card(
             // elevation: 1,
                child: Row(

                    children: [

                      Image(width:100,height:60,image: AssetImage(recommendedRecipes[index]["image"])),
                      Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Breakfast",
                            style: TextStyle(fontSize:12,color: Colors.cyan[600]),
                          ),


                      Text(recommendedRecipes[index]["name"],
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
                          ),SizedBox(width: 10,),
                          Text(
                            recommendedRecipes[index]["calories"],
                            style:
                            TextStyle(color: Colors.deepOrange, fontSize: 12),
                          ),
                        ],
                      ),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.access_time,
                                    size: 15, color: Colors.grey),
                                Text(
                                  recommendedRecipes[index]["time"],
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
                                  recommendedRecipes[index]["serving"],
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),

                          ]
                      ),
                                          ]
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(50, 0, 0, 50)
                        ,child: Icon(FontAwesomeIcons.heart,textDirection: TextDirection.rtl),
                      ),
                       ] )
            );


          });
    }
  }



