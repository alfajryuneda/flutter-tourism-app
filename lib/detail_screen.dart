import 'package:flutter/material.dart';
import 'model/tourism_place.dart';

var myTextStyle = TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: [
                Image.asset(place.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Text(
                  place.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    // fontWeight: FontWeight.bold,
                    fontFamily: 'Staatliches',
                  ),
                )),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        place.openDays,
                        style: myTextStyle,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.access_time),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        place.openTime,
                        style: myTextStyle,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.monetization_on),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        place.ticketPrice,
                        style: myTextStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(16.0),
                child: Text(place.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Oxygen',
                    ))),
            Container(
              height: 150,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: place.imageUrls.map((url) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(url),
                      ),
                    );
                  }).toList()),
            )
          ],
        ),
      ),
    );
  }
}

// safearea for excluding topbar on mobile
