import 'package:browser/screens/google.dart';
import 'package:browser/screens/twitter.dart';
import 'package:browser/screens/youtube.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyTabs extends StatefulWidget {
  const MyTabs({super.key});

  @override
  State<MyTabs> createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: TabBar(
          controller: tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
          ),
          tabs: const <Tab>[
            Tab(
              icon: Icon(FontAwesomeIcons.google),
              text: "Google",
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.youtube),
              text: "Youtube",
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.xTwitter),
              text: "X",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          GoogleScreen(),
          YouTubeScreen(),
          TwitterScreen(),
        ],
      ),
    );
  }
}
