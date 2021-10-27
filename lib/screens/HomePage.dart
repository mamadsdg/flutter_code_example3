import 'dart:ui';

import 'package:ex6/screens/NextPage.dart';
import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements interfaceTest{

  String test = "0.5";
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.blue.withOpacity(0.9), BlendMode.color),
                      image: AssetImage("assets/images/mainpic.jpg"))),
            ),

            Positioned(
              width: 50,
              height: 10,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ),
            Positioned(
                top: size.height * 0.15,
                left: size.width * 0.1,
                child: Row(
                  children: [
                    HexagonWidget.pointy(
                        width: 100,
                        elevation: 4,
                        cornerRadius: 20,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/profile.jpg"))),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mohammad Sedighy",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.white,),
                              Text(
                                test,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )),
            CustomPaint(
              size: Size(size.width, size.height),
              painter: _BNBCustomPainter(),
            ),
            // Positioned(
            //   top: 0,
            Positioned(
              right: 20,
              top: size.height * 0.55,
              child: HexagonWidget.pointy(
                width: 70,
                color: Colors.white,
                elevation: 4,
                cornerRadius: 20,
                child: Text('Help?'),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 10,
              child: HexagonWidget.pointy(
                width: 70,
                color: Colors.blue,
                elevation: 4,
                cornerRadius: 20,
                child: IconButton(
                    icon: Icon(
                  Icons.close,
                  color: Colors.black,
                )),
              ),
            ),
            Positioned(
                top: size.height * 0.5,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ItemMain(
                          txt: "Setting",
                          iconButton: Icons.settings,
                        ),
                        ItemMain(
                          txt: "Payment",
                          iconButton: Icons.monetization_on_sharp,
                        ),
                        ItemMain(
                          txt: "Become a provider",
                          iconButton: Icons.work,
                        ),
                        ItemMain(
                          txt: "Find storage",
                          iconButton: Icons.search,
                        ),
                        ItemMain(
                          txt: "My Storage",
                          iconButton: Icons.account_circle_sharp,
                          function: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => MyStorage()));
                          },
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  String newValue(String testt) {
    setState(() {
      test = testt;
    });
    // TODO: implement newValue
    throw UnimplementedError();
  }
}

class _BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, size.height * 0.4);

    path.quadraticBezierTo(size.width * 0.20, size.height * 0.32,
        size.width * 0.40, size.height * 0.4);
    path.lineTo(size.width * 0.8, size.height * 0.55);
    // path.arcToPoint(Offset(size.width * 0.80, size.height * 0.6),
    //     radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(
        size.width * 0.9, size.height * 0.59, size.width, size.height * 0.65);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// class _MyClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, 0);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height * 0.8);
//     path.lineTo(size.width * 0.8, size.height);
//     path.lineTo(size.width * 0.2, size.height);
//     path.lineTo(0, size.height * 0.8);
//     path.lineTo(0, 0);
//
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

class ItemMain extends StatelessWidget {
  final IconData iconButton;
  final String txt;
  final Function function;

  const ItemMain({Key key, this.iconButton, this.txt, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            HexagonWidget.pointy(
              width: 60,
              color: Colors.white,
              elevation: 4,
              cornerRadius: 20,
              child: IconButton(
                icon: Icon(
                  iconButton,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                txt,
                style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
