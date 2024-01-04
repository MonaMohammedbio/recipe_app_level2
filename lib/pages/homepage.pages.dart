import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var sliderIndex = 0;
  CarouselController carouselControllerEx = CarouselController();
  List<String> imgList = [
    "images/CinnamonToaast.png",
    "images/GlazedSalmon.png",
    "images/Muffins.png",
  ];
  var listTitles = ["CinnamonToast", "GlazedSalmon", "Muffins"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {}, icon: FaIcon(FontAwesomeIcons.barsStaggered)),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.notifications_none,size: 30,)),
              )
            ]),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
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
                    fontFamily: "Abril_Display_Black",
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
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
                            fontFamily: "LibreBaskerville",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: TextButton(
                        onPressed: () {},
                        child: Text("See All",
                            style: TextStyle(
                                fontFamily: "LibreBaskerville",
                                fontSize: 15,
                                color: Colors.deepOrange))),
                  )
                ],
              ),
              Stack(
                children: [
                  CarouselSlider(
                    carouselController: carouselControllerEx,
                    options: CarouselOptions(
                        height:200.0,
                        autoPlay: true,
                        viewportFraction: 0.75,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        onPageChanged: (index, _) {
                          sliderIndex = index;
                          setState(() {});
                        },
                        enlargeStrategy: CenterPageEnlargeStrategy.height),
                    items: imgList.map((item) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Stack(
                            children: [
                              Text('$listTitles'),
                              Image.asset(item),
                            ],
                          ));
                    }).toList(),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
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
                    ),
                  ),
                ],
              ),
              DotsIndicator(
                dotsCount: listTitles.length,
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
              GridView.count(
                shrinkWrap: true,
                  crossAxisCount: 2,
                children: [
                  Card(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Icon(FontAwesomeIcons.heart),
                      AspectRatio(
                        aspectRatio: 18.0 / 11.0,
                        child: Image.asset('images/frenshtoast.png'),
                      ),
                      Text(
                        "Breakfast",
                        style: TextStyle(color: Colors.cyan[600]),
                      ),
                      Text('Frensh Toast with Berries',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Hellix",
                              fontSize: 15)),
                      Row(children: [
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
                      ],)
                     , Text("120 Calories",style: TextStyle(color: Colors.deepOrange,fontSize: 12),),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 15,
                                  color: Colors.grey),

                                Text("10 min:",
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),


                            Row(
                              children: [
                                Icon(
                                  Icons.room_service_outlined,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                Text("1 Serving:",
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),),
                              ],
                            ),



                          ]),
                    ],
                  ),
                ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(FontAwesomeIcons.solidHeart,color: Colors.deepOrange,),
                        AspectRatio(
                          aspectRatio: 18.0 / 11.0,
                          child: Image.asset('images/CinnamonToaast.png'),
                        ),
                        Text(
                          "Breakfast",
                          style: TextStyle(color: Colors.cyan[600]),
                        ),
                        Text('Brown Sugar Cinnamon Toast',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Hellix",
                                fontSize: 15)),
                        Row(children: [
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
                            color: Colors.grey,
                          ),
                        ],)
                        , Text("135 Calories",style: TextStyle(color: Colors.deepOrange,fontSize: 12),),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                      Icons.access_time,
                                      size: 15,
                                      color: Colors.grey),

                                  Text("15 min:",
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),


                              Row(
                                children: [
                                  Icon(
                                    Icons.room_service_outlined,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                  Text("1 Serving:",
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),),
                                ],
                              ),



                            ]),
                      ],
                    ),
                  ),
             ] ),

            ]),
          ),
        ));
  }
}
