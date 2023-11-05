import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'stories.dart';
import 'search_screen.dart';
import 'story_page.dart';

void main() {
  runApp(StartS());
}

class StartS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Counter(),
        '/second': (context) => Search(),
        '/three': (context) => StoryPage(),
      },
    );
  }
}

class Counter extends StatefulWidget {
  Counter({super.key});

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    final xX = MediaQuery.of(context).size.width;
    final yY = MediaQuery.of(context).size.height;
    AppBar appBar = AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark,
        // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      backgroundColor: Colors.transparent,
      title: Text(
        'Все истории',
        style: TextStyle(
          color: Colors.black,
          fontSize: xX / (416 / 20),
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Container(
        alignment: Alignment.center,
        child: Text(
          'BETA',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: xX / (416 / 25),
            ))
      ],
      elevation: 0.0,
    );
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar,
        body: Container(
          padding: EdgeInsets.only(top: 10.0),
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width -
                    ((MediaQuery.of(context).size.width / 14) * 2),
                height: MediaQuery.of(context).size.height / 15,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/three',
                        arguments: stories[Random().nextInt(stories.length)]);
                  },
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width -
                              ((MediaQuery.of(context).size.width / 14) * 2),
                          height: MediaQuery.of(context).size.height / 15,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(1.00, -0.00),
                              end: Alignment(-1, 0),
                              colors: [Color(0xFF9AA1C5), Color(0xFFE69A9A)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  (MediaQuery.of(context).size.height / 13) /
                                      5),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Случайная история',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: xX / (418 / 18),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Expanded(
                child: ListView.custom(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  childrenDelegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return _itemGet(
                          stories[index].storiesTitle, stories[index]);
                    },
                    childCount: stories.length,
                    findChildIndexCallback: (Key key) {
                      final ValueKey valueKey = key as ValueKey;
                      final String data = valueKey.value;
                      return stories.indexOf(data as Story);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> users = <String>[
    "Tom",
    "Alice",
    "Bob",
    "Sam",
    "Kate",
    "Bob",
    "Sam",
    "Kate",
    "Tom",
    "Alice",
    "Bob",
    "Sam",
    "Kate",
    "Bob",
    "Sam",
    "Kate",
  ];

   _itemGet(String title, Story storyE) {
    final xX = MediaQuery.of(context).size.width;
    final yY = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(
            top: 6.0,
            left: MediaQuery.of(context).size.width / 14,
            right: MediaQuery.of(context).size.width / 14,
            bottom: 6.0),
        height: MediaQuery.of(context).size.height / 15,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/three', arguments: storyE);
          },
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  //margin: EdgeInsets.only(top: 5.0, left: 24.0, right: 24.0, bottom: 5.0),
                  width: MediaQuery.of(context).size.width -
                      ((MediaQuery.of(context).size.width / 14) * 2),
                  height: MediaQuery.of(context).size.height / 15,
                  decoration: ShapeDecoration(
                    color: Color(0xFFE9E9E9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          (MediaQuery.of(context).size.height / 13) / 5),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: xX / (418 / 283),
                top: yY / (800 / 33),
                child: Container(
                  width: xX / (418 / 51),
                  height: yY / (800 / 10),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 1,
                        child: Container(
                          width: xX / (418 / 8),
                          height: yY / (800 / 8),
                          child: Icon(
                            Icons.access_time,
                            size: 9,
                          ),
                        ),
                      ),
                      Positioned(
                        left: xX / (418 / 14),
                        top: 1,
                        child: Text(
                          storyE.timeRead,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: xX / (418 / 8),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: xX / (418 / 23),
                top: yY / (800 / 14),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: xX / (418 / 14),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: xX / (418 / 278),
                top: yY / (800 / 14),
                child: Text(
                  storyE.ratingStories,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: xX / 34,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: xX / (418 / 311),
                top: yY / (800 / 13),
                child: Container(
                  width: xX / (418 / 14),
                  height: yY / (800 / 14),
                  child: Icon(
                    Icons.people_outline,
                    size: 20,
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
