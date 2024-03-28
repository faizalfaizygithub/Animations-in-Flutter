import 'package:flutter/material.dart';
import 'package:flutter_animation/models/places.dart';
import 'package:flutter_animation/view/screens/deatailspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Places> places = [];

  @override
  void initState() {
    places = [
      Places(
          name: 'Eiffel Tower',
          price: 89999,
          location: ' Paris, France',
          imagePath: 'assets/img/paris.jpg'),
      Places(
          name: 'Christ the Redeemer (statue)',
          price: 99999,
          location: ' Rio de Janeiro, Brazil,',
          imagePath: 'assets/img/brazil.webp'),
      Places(
          name: 'Maldives Resorts',
          price: 49999,
          location: 'Maldives',
          imagePath: 'assets/img/maldives.jpg'),
      Places(
          name: 'Palawan island',
          price: 39999,
          location: 'Philippinese',
          imagePath: 'assets/img/philp.jpg'),
      Places(
          name: 'Taj Mahal',
          price: 89999,
          location: 'Aghra ,india',
          imagePath: 'assets/img/taj.webp'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Padding(
                    padding: EdgeInsets.only(top: value * 50),
                    child: child,
                  ),
                );
              },
              duration: const Duration(seconds: 2),
              child: const Text(
                'Hi Bro..! \nExplore Your Wisdom',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    Places tourplaces = places[index];
                    return buildCart(tourplaces);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  buildCart(Places tourplaces) {
    return Card(
      color: Colors.blueGrey,
      child: Center(
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeatailsPage(
                    tourplaces: tourplaces,
                  ),
                ));
          },
          leading: Hero(
            tag: "places-img ${tourplaces.imagePath}",
            child: Image.asset(
              tourplaces.imagePath,
              height: 100,
            ),
          ),
          trailing: Text(
            tourplaces.price.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          title: Text(
            tourplaces.name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            tourplaces.location,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
