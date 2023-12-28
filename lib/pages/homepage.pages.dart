import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var sliderIndex = 0;
  CarouselController carouselControllerEx = CarouselController();
  var listValues = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Column(
                children: [
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
                    items: listValues.map((i) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.amber),
                          child: Text(
                            'text $i',
                            style: TextStyle(fontSize: 16.0),
                          ));
                    }).toList(),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(140, 200, 0, 0),
                child: DotsIndicator(
                  dotsCount: listValues.length,
                  position: sliderIndex,
                  onTap: (position) async {
                    await carouselControllerEx.animateToPage(position);
                    sliderIndex = position;
                    setState(() {});
                  },
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                height: 39,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //getIndicatorWidget(false),
                    // back arrow icon.
                    IconButton(
                        onPressed: () => carouselControllerEx.previousPage(),

                        icon: Icon(Icons.arrow_back_ios)),

                    IconButton(
                        onPressed: () => carouselControllerEx.nextPage(),
                        icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
              Center(child: Text('Home Page')),
            ],
          ),
        ),
      ),
    );
  }
}
