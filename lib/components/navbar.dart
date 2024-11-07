import 'package:flutter/material.dart';
import 'package:newpedia/pages/bookmark.dart';
import 'package:newpedia/pages/homepage.dart';
import 'package:newpedia/pages/kategori.dart';
import 'package:newpedia/pages/profile.dart';
import 'package:newpedia/pages/search.dart';

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
    SearchPage(),
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
        bottomNavigationBar: BottomNavigationBar(
          // selectedItemColor: Colors.blue,
          // unselectedItemColor: Colors.grey,
          // type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Kategori',
              icon: Icon(Icons.public)
              ),
            BottomNavigationBarItem(
              label: 'Cari',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
                label: 'Koleksi',
                icon: Badge(
                    label: Text("3"),
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.bookmark_border,
                    ))),
            BottomNavigationBarItem(
              label: 'Akun',
              icon: Icon(Icons.person),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
        ));
  }
}
