import 'package:flutter/material.dart';
import 'package:flutter_animation/models/places.dart';
import 'package:flutter_animation/view/components/assets.dart';
import 'package:flutter_animation/view/components/hearticon.dart';

class DeatailsPage extends StatelessWidget {
  final Places? tourplaces;
  const DeatailsPage({super.key, required this.tourplaces});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: "places-img ${tourplaces!.imagePath}",
                child: Image.asset(
                  height: 400,
                  "${tourplaces!.imagePath}",
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                  title: Text(
                    overflow: TextOverflow.ellipsis,
                    "${tourplaces!.name}",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "₹ '${tourplaces!.price}'-/",
                    style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 36, 5, 5),
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: HeartIcon()),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
