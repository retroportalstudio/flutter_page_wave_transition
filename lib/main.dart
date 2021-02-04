import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_page_wave_transition/second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page Wave Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Music Albums",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Center()),
                  IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
                  CircleAvatar(
                    child: Image.asset("assets/images/dp_default.png"),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(border: InputBorder.none, hintText: "Look for your Interest!", fillColor: Colors.grey.shade200, filled: true),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  DropdownButton(
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      icon: Icon(Icons.keyboard_arrow_down),
                      underline: Container(
                        color: Colors.white,
                      ),
                      items: ["Featured", "Most Rated", "Recent", "Popular"].map<DropdownMenuItem>((e) => DropdownMenuItem(child: Text(e))).toList(),
                      onChanged: (newItem) {}),
                  IconButton(icon: Icon(Icons.sort), onPressed: () {})
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
                      .map(
                        (e) => Card(
                          child: Column(
                            children: <Widget>[
                              Image.asset("assets/images/image_$e.jpg"),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, _) {
                  return SecondScreen();
                },
                opaque: false));
          },
          child: Icon(
            Icons.add,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
