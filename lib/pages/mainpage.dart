import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController(initialPage: 0);

  onTapped(int index) {
    if (index == 3) {
      _pageController.jumpToPage(_pageController.initialPage);
    } else {
      _pageController.jumpToPage(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pyramidion project"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Pyramidion project',
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            ),
            ListTile(
              title: const Text("Page 1"),
              onTap: () {
                onTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Page 2"),
              onTap: () {
                onTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Page 3"),
              onTap: () {
                onTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          button(1),
          button(2),
          button(3),
        ],
      ),
    );
  }

  Widget button(int pageno) {
    return Center(
      child: MaterialButton(
        color: Colors.blue,
        onPressed: () {
          onTapped(pageno);
        },
        child: Text("Go to Page $pageno"),
      ),
    );
  }
}
