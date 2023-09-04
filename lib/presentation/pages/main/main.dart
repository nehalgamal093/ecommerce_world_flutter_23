import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/pages/home/home.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

class Main extends StatefulWidget {
  Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  List _pages = [
    Home(),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecommerce World'),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/cat.png',width:100,height:100),
                    Text('Nehal Gamal',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              SizedBox(height:100),
              ListTile(
                leading: ImageIcon(AssetImage('assets/icons/account.png')),
                title: Text('Account'),
              ),
              Divider(),
               ListTile(
                leading: ImageIcon(AssetImage('assets/icons/setting.png')),
                title: Text('Setting'),
              ),
              Divider(),
               ListTile(
                leading: ImageIcon(AssetImage('assets/icons/wallet.png')),
                title: Text('Wallet'),
              ),
              Divider(),
               ListTile(
                leading: ImageIcon(AssetImage('assets/icons/signout.png')),
                title: Text('Sign out'),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
        child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: ColorManager.orange,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/store.png')),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/heart100.png')),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/message.png')),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/person.png')),
                  label: 'Home'),
            ]),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}