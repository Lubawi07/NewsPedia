import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newpedia/pages/bookmark.dart';
import 'package:newpedia/pages/homepage.dart';
import 'package:newpedia/pages/kategori.dart';
import 'package:newpedia/pages/profile.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    KategoriPage(),
    BookMark(),
    Profile(),
    //pakai text dulu kalo bisa pindah2
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
//   @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         body: Center(
//           child: _widgetOptions.elementAt(_selectedIndex),
//         ),
//       bottomNavigationBar: SalomonBottomBar(
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//          items: [
//           SalomonBottomBarItem(
//             title: Text('Home'),
//             icon: Icon(Icons.home_outlined),
//           ),
//           SalomonBottomBarItem(
//             title: Text('Cari'),
//             icon: Icon(Icons.search)
//           ),
//           SalomonBottomBarItem(
//             title: Text('Koleksi'),
//             icon: Icon(Icons.bookmark_border)
//           ),
//           SalomonBottomBarItem(
//             title: Text('Akun'),
//             icon: Icon(Icons.person)
//           ),
//          ],
//          currentIndex: _selectedIndex,
//          onTap: _onItemTap,
//       )
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTap,
          destinations: const[
            NavigationDestination(
              label: 'Home',
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              label: 'Kategori',
              icon: Icon(Icons.public_outlined),
              selectedIcon: Icon(Icons.public),
              ),
           NavigationDestination(
                label: 'Koleksi',
                icon: Badge(
                    label: Text("3"),
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.bookmark_border_outlined,
                    )),
                    selectedIcon: Badge(
                    label: Text("3"),
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.bookmark,
                    )),
                    ),
            NavigationDestination(
              label: 'Akun',
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
            ),
          ]
        ));
  }
}
