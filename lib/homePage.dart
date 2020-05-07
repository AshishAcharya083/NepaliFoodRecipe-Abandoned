import 'package:flutter/material.dart';
import 'searchbar.dart';
import 'cards.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 12,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Home',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SearchBar(),
              ),
              Text(
                'Category',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Expanded(
                  flex: 2,
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CategoryCard(
                        elevation: 5,
                        category: 'खाजा  ',
                        networkImage:
                            'https://images.pexels.com/photos/103124/pexels-photo-103124.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                        numberOfRecipe: '10',
                      ),
                      CategoryCard(
                        elevation: 5,
                      
                        category: 'खाना ',
                        networkImage:
                            'https://www.thelongestwayhome.com/blog/wp-content/uploads/2012/04/Dal-Bhat-in-Nepal-tourist-version.jpg',
                        numberOfRecipe: '10',
                      ),
                      CategoryCard(
                        elevation: 5,
                        category: 'भोजन',
                        networkImage:
                            'https://freetibet.org/files/styles/media_box/public/Momos.jpg?itok=ll8VC1NS',
                        numberOfRecipe: '10',
                      ),
                      CategoryCard(
                        elevation: 5,
                        category: 'Breakfast',
                        networkImage:
                            'https://freetibet.org/files/styles/media_box/public/Momos.jpg?itok=ll8VC1NS',
                        numberOfRecipe: '10',
                      ),
                    ],
                  )),
              Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration:
                            new BoxDecoration(color: Colors.transparent),
                        child: new TabBar(
                            labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            isScrollable: true,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.green,
                            labelPadding: EdgeInsets.symmetric(horizontal: 18),
                            labelColor: Colors.black,
                            unselectedLabelStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
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
                        child: new TabBarView(
                            controller: _tabController,
                            children: [
                              ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical:10.0),
                                  child: CategoryCard(
                                    elevation: 1,
                                    
                                      networkImage:
                                          'https://freetibet.org/files/styles/media_box/public/Momos.jpg?itok=ll8VC1NS',
                                      category: 'berak'),
                                );
                              }),
                              Tab(
                                text: 'Vegetable ',
                              ),
                              Tab(
                                text: 'Fruit',
                              ),
                              Tab(
                                text: 'Mrat',
                              )
                            ]),
                      ))
                    ],
                  )),
            ],
          ),
        ));
  }
}
