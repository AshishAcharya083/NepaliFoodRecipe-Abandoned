import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:food/components/searchbar.dart';
import 'package:food/components/cards.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food/constants.dart';
import 'package:food/models/favorites_list.dart';
import 'package:food/models/recipe_list.dart';
import 'package:food/models/recipe_structure.dart';
import 'package:food/screens/cooking_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:food/models/ads.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<int> vegetable = [];
  List<int> meat = [];
  List<int> popular = [];
  List<int> fruitAndDrinks = [];
  Widget _currentAd;

  void initState() {
    super.initState();
    FacebookAudienceNetwork.init(
      testingId: "b97781a1-356c-4736-bbb6-14dfd078f9ed",
    );
    _tabController = TabController(vsync: this, length: 4);
    getFood();
    Provider.of<FavoritesList>(context, listen: false).initiatePref();

    setState(() {
      _currentAd = myBannerAd();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesList>(builder: (context, snapshot, _) {
      return Scaffold(
        appBar: AppBar(
          titleSpacing: 12,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Home',
              style: kEnglishTextStyle.copyWith(
                  color: Colors.black, fontSize: 30, letterSpacing: 0)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: SearchBar(),
                ),
                myCarouselSlider(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(width: 400, height: 300, child: myTabBar()),
                Container(child: _currentAd),
              ],
            ))
          ],
        ),
      );
    });
  }

  CarouselSlider myCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          enlargeCenterPage: true, autoPlay: true, aspectRatio: 2, height: 200),
      items: popular.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  recipeList[i].image,
                  fit: BoxFit.cover,
                ),
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
            );
          },
        );
      }).toList(),
    );
  }

  Column myTabBar() {
    return Column(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(color: Colors.transparent),
          child: new TabBar(
              labelStyle: GoogleFonts.getFont('Hind',
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.green,
              labelPadding: EdgeInsets.symmetric(horizontal: 18),
              labelColor: Colors.black,
              unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 18),
              controller: _tabController,
              tabs: [
                Tab(
                  text: 'लोकप्रिय',
                ),
                Tab(
                  text: 'सागसब्जी',
                ),
                Tab(
                  text: 'फल र जुस',
                ),
                Tab(
                  text: 'मासु',
                )
              ]),
        ),
        Expanded(
            child: Container(
          height: 20.0,
          child: new TabBarView(controller: _tabController, children: [
            ListView.builder(
                //OPTION: POPULAR
                itemCount: popular.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CookingScreen(
                                      indexOfFood: popular[index],
                                    )));
                      },
                      child: CategoryCard(
                          networkImage: recipeList[popular[index]].image,
                          // ?? errorImage,
                          foodName: recipeList[popular[index]].name),
                    ),
                  );
                }),
            ListView.builder(
              //OPTION VEGETABLE
              itemCount: vegetable.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CookingScreen(
                                  indexOfFood: vegetable[index],
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: CategoryCard(
                        networkImage: recipeList[vegetable[index]].image,
                        // ?? errorImage,
                        foodName: recipeList[vegetable[index]].name),
                  ),
                );
              },
            ),
            ListView.builder(
              //OPTION FRUIT
              itemCount: fruitAndDrinks.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CookingScreen(
                                  indexOfFood: fruitAndDrinks[index],
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: CategoryCard(
                        networkImage: recipeList[fruitAndDrinks[index]].image ??
                            errorImage,
                        foodName: recipeList[fruitAndDrinks[index]].name),
                  ),
                );
              },
            ),
            ListView.builder(
              //OPTION MEAT
              itemCount: meat.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CookingScreen(
                                  indexOfFood: meat[index],
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: CategoryCard(
                        networkImage: recipeList[meat[index]].image,
                        // ?? errorImage,
                        foodName: recipeList[meat[index]].name),
                  ),
                );
              },
            ),
          ]),
        ))
      ],
    );
  }

  void getFood() {
    for (int i = 0; i < recipeList.length; i++) {
      if (recipeList[i].popular == true) {
        setState(() {
          popular.add(i);
        });
      }

      if (recipeList[i].veg == true) {
        setState(() {
          vegetable.add(i);
        });
      }
      if (recipeList[i].mainItem == MainItem.meat) {
        setState(() {
          meat.add(i);
        });
      }

      if (recipeList[i].mainItem == MainItem.fruit ||
          recipeList[i].category == Category.drinks) {
        setState(() {
          fruitAndDrinks.add(i);
        });
      }
    }
  }
}
