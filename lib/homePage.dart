import 'package:flutter/material.dart';
// import 'package:floating_search_bar/floating_search_bar.dart';
import 'searchbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          padding: const EdgeInsets.only(left: 12.0),
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
                        category: 'खाजा  ',
                        networkImage:
                            'https://images.pexels.com/photos/103124/pexels-photo-103124.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                        numberOfRecipe: '10',
                      ),
                       CategoryCard(
                        category: 'खाना ',
                        networkImage:
                            'https://www.thelongestwayhome.com/blog/wp-content/uploads/2012/04/Dal-Bhat-in-Nepal-tourist-version.jpg',
                        numberOfRecipe: '10',
                      ),
                       CategoryCard(
                        category: 'भोजन',

                        networkImage:
                            'https://freetibet.org/files/styles/media_box/public/Momos.jpg?itok=ll8VC1NS',
                        numberOfRecipe: '10',
                      ),
                       CategoryCard(
                        category: 'Breakfast',
                        networkImage:
                            'https://freetibet.org/files/styles/media_box/public/Momos.jpg?itok=ll8VC1NS',
                        numberOfRecipe: '10',
                      ),
                    ],
                    
                  )),
              Expanded(

                  flex: 3,
                  child:Column(children: <Widget>[
                                      Text('मुख्य परिकार '),

                  ],)),
            ],
          ),
        ));
  }
}

class CategoryCard extends StatelessWidget {
  final String networkImage;
  final String category;
  final String numberOfRecipe;

  CategoryCard(
      {@required this.networkImage,
      @required this.category,
      this.numberOfRecipe});
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 120,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(networkImage), fit: BoxFit.cover)),
              ),
            ),
            Text(
              category,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            Text(
              '$numberOfRecipe नुस्खा ',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ));
  }
}
