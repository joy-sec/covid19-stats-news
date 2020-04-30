import 'package:covid19/views/all_country.dart';
import 'package:covid19/views/home.dart';
import 'package:covid19/views/news.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'covid19',
      theme: ThemeData.dark(),
      home: MiddleWarePage(),
    );
  }
}

class MiddleWarePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MiddleWarePage();
  }
}

class _MiddleWarePage extends State<MiddleWarePage> {
  List<BottomNavigationBarItem> list = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
    BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.globe), title: Text("World")),
    BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.newspaper), title: Text("News"))
  ];

  List<Widget> listWidgets = [
    HomePage(),
    AllCountryPage(),
    NewsPage(),
  ];

  int _currentIndex = 0;

  void _onTapBottomNavBar(i) {
    setState(() {
      _currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("covid 19",style: GoogleFonts.roboto(textStyle: TextStyle(
          color: Colors.red,letterSpacing: 4
        )),),
      ),
      body: listWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: list,
        currentIndex: _currentIndex,
        onTap: _onTapBottomNavBar,
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
