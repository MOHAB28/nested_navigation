import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:revision/routes/route.gr.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({Key? key}) : super(key: key);
    static const List<String> _title = <String>[
    'New Trend',
    'Categories',
    'Favorites',
  ];
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        backgroundColor: Colors.white,
        title:  Text(_title.elementAt(tabsRouter.activeIndex)),
        centerTitle: true,
        leading: const AutoBackButton(),
      ),
      backgroundColor: Colors.white,
      routes: const [
        ProductsRouter(),
        CategoriesRouter(),
        FavoriteRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: '',
          ),
        ],
        );
      },
    );
  }
}

// class LayoutPage extends StatefulWidget {
//   const LayoutPage({Key? key}) : super(key: key);

//   @override
//   State<LayoutPage> createState() => _LayoutPageState();
// }

// class _LayoutPageState extends State<LayoutPage> {
//   int _selectedIndex = 0;
//   static const List<Widget> _widgetOptions = <Widget>[
//     ProductsPage(),
//     CategoriesPage(),
//     Favoritepage(),
//   ];


//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_title.elementAt(_selectedIndex)),
//       ),
//       body: _widgetOptions.elementAt(_selectedIndex),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.category_rounded),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_rounded),
//             label: '',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: const Color.fromARGB(255, 17, 0, 255),
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
