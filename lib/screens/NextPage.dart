import 'package:ex6/screens/HomePage.dart';
import 'package:flutter/material.dart';

class MyStorage extends StatefulWidget {
  const MyStorage({Key key}) : super(key: key);

  @override
  _MyStorageState createState() => _MyStorageState();
}

class _MyStorageState extends State<MyStorage> {
  Color currentColor = Colors.blueAccent;
  Color pastColor = Colors.white;
  String shapeUse = "current";
  interfaceTest tettt;

  @override
  void initState() {
    // TODO: implement initState
    tettt = HomePage() as interfaceTest;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.blue.withOpacity(0.9), BlendMode.color),
                    image: AssetImage("assets/images/mainpic.jpg"))),
            child: Center(
              child: Text(
                'mrflutter.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Positioned(
            child: AppBar(
              title: Text("My storage"),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          CustomPaint(
            size: Size(size.width, size.height),
            painter: _BNBCustomPainterMain(shapeUse),
          ),
          Positioned(
            width: size.width,
            top: size.height * 0.17,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [currentPage(currentColor), pastPage(pastColor)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  myStorageBody() {
    return Container();
  }

  currentPage(Color clr) {
    return GestureDetector(
        onTap: () {
          currentPageTab();
        },
        child: Text(
          "Current",
          style:
              TextStyle(color: clr, fontSize: 30, fontWeight: FontWeight.w600),
        ));
  }

  pastPage(Color clr) {
    return GestureDetector(
        onTap: () {
          pastPageTab();
        },
        child: Text("Past",
            style: TextStyle(
                color: clr, fontSize: 30, fontWeight: FontWeight.w600)));
  }

  pastPageTab() {
    setState(() {
      shapeUse = "past";
      pastColor = Colors.blue;
      currentColor = Colors.white;
      tettt.newValue("2");
    });
  }

  currentPageTab() {
    setState(() {
      shapeUse = "current";
      pastColor = Colors.white;
      currentColor = Colors.blue;
    });
  }
}

class _BNBCustomPainterLeft extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _BNBCustomPainterMain extends CustomPainter {
  String shape = "past";

  _BNBCustomPainterMain(this.shape);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    if (shape == "past") {
      Path path = Path()..moveTo(size.width, size.height * 0.17);

      path.quadraticBezierTo(size.width * 0.80, size.height * 0.09,
          size.width * 0.60, size.height * 0.17);
      path.lineTo(0, size.height * 0.37);
      // path.arcToPoint(Offset(size.width * 0.80, size.height * 0.6),
      //     radius: Radius.circular(10.0), clockwise: false);
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);

      canvas.drawPath(path, paint);
    } else {
      Path path = Path()..moveTo(0, size.height * 0.17);

      path.quadraticBezierTo(size.width * 0.20, size.height * 0.09,
          size.width * 0.40, size.height * 0.17);
      path.lineTo(size.width, size.height * 0.37);
      // path.arcToPoint(Offset(size.width * 0.80, size.height * 0.6),
      //     radius: Radius.circular(10.0), clockwise: false);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class interfaceTest{
  String newValue(String testt){}
}