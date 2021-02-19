# Scrolling Navbar

A package that creates a scrolling navbar, useful for landing pages and cool people




![alt text](https://media.discordapp.net/attachments/704804916438499378/812427147310399538/2021-02-19_15.52.46.gif?width=1666&height=1009)

## Basic Case

For a basic case, supply this widget with an AppBar and a list of children widgets (just like a row or column)

```dart

import 'package:flutter/material.dart';

import 'package:scrolling_navbar/scrolling_navbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ScrollingNavbar(
          // This is just a normal AppBar
          appBar: AppBar(),
          // The Scrolling Navbar will make links for each widget to scroll to
          children: [
            MyPage1Widget(),
            MyPage2Widget(),
            MyPage3Widget(),
          ],
        ),
      ),
    );
  }
}

```

## Customize

To change the name of the links, supply a list of strings into the header variable

![alt text](https://media.discordapp.net/attachments/704804916438499378/812424684011520000/2021-02-19_15.44.11.gif?width=1664&height=1011)

```dart

ScrollingNavbar(
    // This is just a normal AppBar
    appBar: AppBar(),
    // This will change the names of the titles
   headings: [
    'Page 1',
    'Page 2',
    'Page 3',
    ],
    // The Scrolling Navbar will make links for each widget to scroll to
    children: [
    MyPage1Widget(),
    MyPage2Widget(),
    MyPage3Widget(),
    ],
),
     
```

The Scrolling Navbar takes an [AppBar()](https://api.flutter.dev/flutter/material/AppBar-class.html) as a parameter so that you can customize it to your hearts content


```dart
ScrollingNavbar(
    appBar: AppBar(
    // Increase the height
    toolbarHeight: 70,

    // Add that snazzy logo
    leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
            'https://d3mds3ychln71.cloudfront.net/img/flutter-logo@3x.png'),
    ),

    // Fatten it up
    leadingWidth: 200,

    // Change the background color
    backgroundColor: Colors.red,

    // Style the links
    titleTextStyle: TextStyle(fontSize: 24, color: Colors.blue[900]),

    // Throw some buttons after the fact
    actions: <Widget>[
        IconButton(
        icon: Icon(Icons.shopping_cart),
        tooltip: 'Open shopping cart',
        onPressed: () {
            // handle the press
        },
        ),
    ],
    ),
    headings: [
    'Page 1',
    'Page 2',
    'Page 3',
    ],
    // The Scrolling Navbar will make links for each widget to scroll to
    children: [
    MyPage1Widget(),
    MyPage2Widget(),
    MyPage3Widget(),
    ],
),
```



![alt text](https://media.discordapp.net/attachments/704804916438499378/812432106814177301/unknown.png?width=1684&height=1010)
