import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food/components/searchbar.dart';
import 'package:food/components/cards.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food/constants.dart';
import 'package:food/models/recipe_list.dart';
import 'package:food/models/recipe_structure.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food/models/searching.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<int> vegetable = [];
  List<int> meat = [];

  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    getFood();
       
  }

  void getFood() {
    for (int i = 0; i < recipeList.length; i++) {
      if (recipeList[i].veg == true) {
        setState(() {
          vegetable.add(i);
        });
      }
      if(recipeList[i].mainItem == MainItem.meat){
        setState(() {
          meat.add(i);
        });
        
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 12,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Home',
              style: kEnglishTextStyle.copyWith(
                  color: Colors.black, fontSize: 30, letterSpacing: 0)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SearchBar(),
              ),
              Expanded(
                  flex: 2,
                  child: OrientationBuilder(builder: (context, orientation) {
                    return GestureDetector(
                      onTap: ()=>launch('https://unsplash.com/@amir_v_ali'),
                                          child: CarouselSlider(
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 2,
                            height: 400),
                        items: [1, 2, 3].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              recipeList[i - 1].image),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.amber));
                            },
                          );
                        }).toList(),
                      ),
                    );
                  })),
              Expanded(flex: 3, child: myTabBar()),
            ],
          ),
        ));
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
                  text: 'फल',
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
            ListView.builder( //OPTION: POPULAR
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: CategoryCard(
                        networkImage:
                            'https://freetibet.org/files/styles/media_box/public/Momos.jpg?itok=ll8VC1NS',
                        foodName: 'momo'),
                  );
                }),
            ListView.builder( //OPTION VEGETABLE
              itemCount: vegetable.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CategoryCard(
                      networkImage: recipeList[vegetable[index]].image,
                      foodName: recipeList[vegetable[index]].name),
                );
              },
            ),
            ListView.builder( //OPTION FRUIT
              itemCount: vegetable.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CategoryCard(
                      networkImage: recipeList[vegetable[index]].image,
                      foodName: recipeList[vegetable[index]].name),
                );
              },
            ),
             ListView.builder( //OPTION MEAT
              itemCount: meat.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CategoryCard(
                      networkImage: recipeList[meat[index]].image,
                      foodName: recipeList[meat[index]].name),
                );
              },
            ),
            
          ]),
        ))
      ],
    );
  }
}
