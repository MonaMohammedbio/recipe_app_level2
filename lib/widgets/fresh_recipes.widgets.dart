import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  List freshRecipes = [
    {
      "image":"images/freshtoast.png",
      "name": "Frensh Toast with Berries",
      "calories": "120 Calories",
      "time": "10 min",
      "serving": "1 Serving",

    },
    {
      "image": "images/Cinnamon Toaast.png",
      "name": "Brown Sugar Cinnamon Toast",
      "calories": "135 Calories",
      "time": "15 min",
      "serving": "1 Serving"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      addRepaintBoundaries: true,
        scrollDirection: Axis.horizontal,
        primary: true,
        shrinkWrap: true,
        itemCount: freshRecipes.length,
        itemBuilder: (context, index) {
          return Card(
            borderOnForeground: true,
            margin: EdgeInsets.only(right: 30),
            //elevation: 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(FontAwesomeIcons.heart),
                    Transform.translate(offset:Offset(50,0),child: Image(width:150,height:70,image: AssetImage(freshRecipes[index]["image"]))),
                    Text(
                      "Breakfast",
                      style: TextStyle(fontSize:12,color: Colors.cyan[600]),
                    ),
                    Text(freshRecipes[index]["name"],
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
                      freshRecipes[index]["calories"],
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
                                freshRecipes[index]["time"],
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
                                freshRecipes[index]["serving"],
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ]));


        });
  }
}
