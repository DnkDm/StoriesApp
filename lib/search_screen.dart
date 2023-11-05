import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'stories.dart';
import 'main.dart';

void main() {
  runApp(Search());
}

class Search extends StatefulWidget {
  Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    _searchStories();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE9E9E9),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              color: Colors.black,
              size: MediaQuery.of(context).size.width / (416 / 25),
            ),
          ),
          title: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // CLear the search field
                    },
                  ),
                  hintText: ' Search...',
                  border: InputBorder.none),
            ),
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: Expanded(
              child: ListView.custom(
                padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                childrenDelegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return _itemGet(_filteredStories[index].storiesTitle, _filteredStories[index]);
                  },
                  childCount: _filteredStories.length,
                  findChildIndexCallback: (Key key) {
                    final ValueKey valueKey = key as ValueKey;
                    final String data = valueKey.value;
                    return _filteredStories.indexOf(data as Story);
                  },
                ),
              ),
            )),
      ),
    );
  }

  var _filteredStories = <Story>[
    Story('storiesTitle', 'ratingStories', 'timeRead', 'textStory'),
  ];

  final _searchController = TextEditingController();

  void _searchStories() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredStories = stories.where((Story story) {
        return story.storiesTitle.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredStories = stories;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _searchController.addListener(_searchStories);
  }

  Widget _itemGet(String title, Story storyE) {
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
