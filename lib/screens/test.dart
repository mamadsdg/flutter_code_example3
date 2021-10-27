import 'package:flutter/material.dart';


class test extends StatefulWidget implements country_info {
  const test({Key key}) : super(key: key);

  @override
  _testState createState() => _testState();

  @override
  String country_name(String sa) {
    // TODO: implement country_name
    String a = sa;
    throw UnimplementedError();
  }

  @override
  String flag_image_url() {
    // TODO: implement flag_image_url
    throw UnimplementedError();
  }
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class country_info {
  String country_name(String sa){}
  String flag_image_url(){}
}