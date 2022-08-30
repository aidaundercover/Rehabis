import 'package:flutter/material.dart';
import 'package:rehabis/models/memor_tile.dart';
import 'package:rehabis/views/exercises/exerciseWidgets.dart';
import 'package:rehabis/views/exercises/memory/getData.dart';

class MatchingGame extends StatefulWidget {
  const MatchingGame({Key? key}) : super(key: key);

  @override
  State<MatchingGame> createState() => _MatchingGameState();
}

class _MatchingGameState extends State<MatchingGame> {
  List<MemoryTile> gridViewTiles = [];
  List<MemoryTile> questionPairs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    points = 0;
    reStart();
  }

  void reStart() {
    myPairs = getPairs();
    myPairs.shuffle();

    gridViewTiles = myPairs;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        print("2 seconds done");
        questionPairs = getQuestionPairs();
        gridViewTiles = questionPairs;
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: exerciseAppbar("Matching Game", context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  textHeader(width * 0.65,
                      "By finding the matching card witihin the least number of interactions, user can test ones memory abilities"),
                  points != 800
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "$points/800",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter'),
                            ),
                            Text(
                              "Points",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Inter'),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
              // SizedBox(child: GridView.count(crossAxisCount: 4)),
        
              Container(
                height: height * 0.8,
                width: width * 0.95,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    points != 800
                        ? GridView(
                            shrinkWrap: true,
                            //physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    mainAxisSpacing: 0.0,
                                    maxCrossAxisExtent: 100.0),
                            children:
                                List.generate(gridViewTiles.length, (index) {
                              return Tile(
                                imagePathUrl:
                                    gridViewTiles[index].getImageAssetPath(),
                                tileIndex: index,
                                parent: this,
                              );
                            }),
                          )
                        : Container(
                            child: Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    points = 0;
                                    reStart();
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 200,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Text(
                                    "Replay",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // TODO
                                },
                                child: Container(
                                  height: 50,
                                  width: 200,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blue, width: 2),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Text(
                                    "Rate Us",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  String? imagePathUrl;
  int? tileIndex;
  _MatchingGameState? parent;

  Tile({Key? key, this.imagePathUrl, this.tileIndex, this.parent})
      : super(key: key);

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          setState(() {
            myPairs[widget.tileIndex!].setIsSelected(true);
          });
          if (selectedTile != "") {
            /// testing if the selected tiles are same
            if (selectedTile ==
                myPairs[widget.tileIndex!].getImageAssetPath()) {
              print("add point");
              points = points + 100;
              print(selectedTile + " thishis" + widget.imagePathUrl!);

              MemoryTile tileModel = MemoryTile();
              print(widget.tileIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                tileModel.setImageAssetPath("");
                myPairs[widget.tileIndex!] = tileModel;
                print(selectedIndex);
                myPairs[selectedIndex] = tileModel;
                widget.parent!.setState(() {});
                setState(() {
                  selected = false;
                });
                selectedTile = "";
              });
            } else {
              print(selectedTile +
                  " thishis " +
                  myPairs[widget.tileIndex!].getImageAssetPath());
              print("wrong choice");
              print(widget.tileIndex);
              print(selectedIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                widget.parent!.setState(() {
                  myPairs[widget.tileIndex!].setIsSelected(false);
                  myPairs[selectedIndex].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });

              selectedTile = "";
            }
          } else {
            setState(() {
              selectedTile = myPairs[widget.tileIndex!].getImageAssetPath();
              selectedIndex = widget.tileIndex!;
            });

            print(selectedTile);
            print(selectedIndex);
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: myPairs[widget.tileIndex!].getImageAssetPath() != ""
            ? Image.asset(myPairs[widget.tileIndex!].getIsSelected()
                ? myPairs[widget.tileIndex!].getImageAssetPath()
                : widget.imagePathUrl!)
            : Container(
                color: Colors.white,
                child: Image.asset("assets/correct.png"),
              ),
      ),
    );
  }
}
