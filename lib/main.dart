import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      home: BossMode(),
    );
  }
}

class BossMode extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return new Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Icon(Icons.arrow_back, color: Colors.black, size: 30.0,),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Icon(Icons.search, size: 30.0,),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Icon(Icons.menu, size: 30.0,),
          )
        ],
      ),
        body: Container(
          color: Colors.white,
          width: width,
          height: height,
          child: CustomPaint(
              painter: ShapesPainter(),
              child: Center(
                child: Container(
                  height: height,
                  width: width,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 30.0),
                        child: Text("Popular", style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'PS',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),),
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          children: <Widget>[
                            ShopItem("Thor", "Slideshow Collectibles", "\$685"),
                            ShopItem("Cyborg Superman", "Statue by Prime 1 Studio", "\$1229"),
                            ShopItem("Iron Man Mark IV", "Collectible Set by Hot Toys", "\$635"),
                            ShopItem("Hulkbuster", "Statue by Iron Studios", "\$289"),
                            ShopItem("Spider-Man 2099", "Manufactured by Prime 1 Studios", "\$699"),
                            ShopItem("Thor", "Slideshow Collectibles", "\$685"),
                            ShopItem("Cyborg Superman", "Statue by Prime 1 Studio", "\$1229"),
                            ShopItem("Iron Man Mark IV", "Collectible Set by Hot Toys", "\$635"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
        )
    );
  }
}

class ShapesPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint();
    paint.color = Color.fromRGBO(37, 27, 205, 1.0);
    var center = Offset(size.width, 0);
    canvas.drawCircle(center, 300.0, paint);

    var center1 = Offset(0, size.height);
    canvas.drawCircle(center1, 200.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

}

class ShopItem extends StatelessWidget{
  final String nameItem;
  final String desc;
  final String price;

  ShopItem(String this.nameItem, String this.desc, String this.price);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Container(
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
              color: Colors.black54,
              offset: Offset(10.0, 5.0),
              blurRadius: 10.0,

            )
          ]
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(nameItem, style: TextStyle(fontFamily: 'PS', fontSize: 20.0, fontWeight: FontWeight.w700),),
                Text(desc, style: TextStyle(fontFamily: 'PS'),),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Text(price, style: TextStyle(fontFamily: 'PS', fontSize: 20.0, fontWeight: FontWeight.w700)),
                      Spacer(),
                      InkWell(
                        borderRadius: BorderRadius.circular(40.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: Container(
                            color: Color.fromRGBO(37, 27, 205, 1.0),
                            width: 80.0,
                            height: 30.0,
                            child: Center(
                              child: Text("BUY", style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}