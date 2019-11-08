import 'package:flutter/material.dart';
import 'cartpage.dart';
import 'homepage.dart';
import 'msgpage.dart';
import 'personpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: indexpage(),
    );
  }
}

class indexpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _indexState();
  }
}

class _indexState extends State<indexpage> {
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('主页')),
    BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('消息')),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('联系人'))
  ];

  int current;

  final pages = [home_page(), msgpage(), cartpage(), personpage()];

  void initState() {
    super.initState();
    current = 0;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: current,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _change(index);
        },
      ),
      body: pages[current],
    );
  }

  void _change(int index) {
    if (index != current) {
      setState(() {
        current = index;
      });
    }
  }
}
