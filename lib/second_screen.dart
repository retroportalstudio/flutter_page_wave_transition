import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              child: TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: Duration(milliseconds: 1500),
                  builder: (context, value, child) {
                    return ShaderMask(
                        shaderCallback: (rect) {
                          return RadialGradient(
                                  radius: value * 5, colors: [Colors.white, Colors.white, Colors.transparent, Colors.transparent], stops: [0.0, 0.55, 0.6, 1.0], center: FractionalOffset(0.95, 0.95))
                              .createShader(rect);
                        },
                        child: PageContent());
                  }),
            );
          },
        ));
  }
}

final data = [
  {"banner": "apex_banner", "title": "Youtube", "message": "Welcome to Youtube"},
  {"banner": "destiny_banner", "title": "Stadia", "message": "Stadia Community Forums"},
  {"banner": "pubg_banner", "title": "Youtube", "message": "PUBG Events"}
];

class PageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      MdiIcons.ticket,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {}),
                Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.videogame_asset,
                          size: 25,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(
                          Icons.group,
                          size: 25,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "assets/images/profile.png",
                      width: 25,
                      height: 25,
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                "assets/images/stadia_mono.png",
                color: Colors.white10,
                fit: BoxFit.cover,
                scale: 10.0,
                alignment: Alignment.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(icon: Icon(MdiIcons.youtube), color: Colors.white, onPressed: () {}),
                          SizedBox(
                            width: 10.0,
                          ),
                          IconButton(icon: Icon(MdiIcons.reddit), color: Colors.white, onPressed: () {}),
                          SizedBox(
                            width: 10.0,
                          ),
                          IconButton(icon: Icon(MdiIcons.twitter), color: Colors.white, onPressed: () {}),
                          SizedBox(
                            width: 10.0,
                          ),
                          IconButton(icon: Icon(MdiIcons.facebook), color: Colors.white, onPressed: () {}),
                          SizedBox(
                            width: 10.0,
                          ),
                          IconButton(icon: Icon(MdiIcons.instagram), color: Colors.white, onPressed: () {}),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Stack(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/images/${data[index]["banner"]}.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox.expand(
                                          child: Container(
                                            decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black87, Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Text(
                                                    data[index]["title"],
                                                    style: TextStyle(color: Colors.white, fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text(
                                                    data[index]["message"],
                                                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
