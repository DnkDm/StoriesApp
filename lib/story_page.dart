import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'stories.dart';

void main() {
  runApp(StoryPage());
}

class StoryPage extends StatefulWidget {
  StoryPage({super.key});

  @override
  _StoryPage createState() => _StoryPage();
}

class _StoryPage extends State<StoryPage> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)?.settings.arguments as Story;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "Все истории",
            style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.width / (416 / 19),
                fontWeight: FontWeight.bold),
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar brightness (optional)
            statusBarIconBrightness: Brightness.dark,
            // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: MediaQuery.of(context).size.width / (416 / 25),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 30,
                child: Text(
                  argument.storiesTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width -
                    ((MediaQuery.of(context).size.width / 14) * 2),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text(
                      argument.ratingStories,
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.people_outline,
                      size: 17,
                    ),
                    Expanded(child: SizedBox()),
                    Icon(
                      Icons.access_time,
                      size: 14,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      argument.timeRead,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 6.0),
                  width: MediaQuery.of(context).size.width -
                      ((MediaQuery.of(context).size.width / 14) * 2),
                  child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 14.0, bottom: 80.0),
                      child: Text( argument.textStory,
                      style:  TextStyle(fontSize: MediaQuery.of(context).size.width / (418 / 15)),
                      textAlign: TextAlign.justify,)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
