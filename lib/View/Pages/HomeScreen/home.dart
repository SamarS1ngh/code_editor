import 'package:codeEditor/View/Pages/HomeScreen/widgets/questions_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
// Defining mock list of topics
//This list will be fed from the topics in problems list in viewmodel class
//the categories list here, question list of each topic will be under a single list called from API.

  List<String> categories = [
    "Array",
    "Linked Lists",
    "Binary Search",
    "Recursion",
    "Bit Manipulation",
    "Sliding Window",
    "Tries",
    "Trees",
    "Stack",
    "Queue"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        elevation: 1,
        title: const Text('Code Testing App'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            //user profile section
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(),
                accountName: Text('User Name'),
                accountEmail: Text('useremail@gmail.com')),
            ListTile(
              title: Text('Item 1'),
            ),
            ListTile(
              title: Text('Item 2'),
            ),
            ListTile(
              title: Text('Item 3'),
            )
          ],
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return QuestionCategories(
            category: categories[index],
          );
        },
      ),
    ));
  }
}
