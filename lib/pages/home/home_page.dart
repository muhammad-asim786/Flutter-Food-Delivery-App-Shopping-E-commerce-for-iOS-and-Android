import 'package:delivery_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main_food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex= 0;

  List pages =[
    MainFoodPage(),
    Container(child: Center(child: Text('nextpage',style: TextStyle(fontSize: 50),)),),
    Container(child: Center(child: Text('nextpage2',style: TextStyle(fontSize: 50),)),),
    Container(child: Center(child: Text('nextpage3',style:TextStyle(fontSize: 50),)),),

  ];
  void onTapNav(int index){
     setState(() {
       _selectedIndex= index;
     });
  }

 /* @override
  void initState(){
    super.initState();
    _controller =  PersistentTabController(initialIndex: 0);
  }*/
 /* List<Widget> _buildScreens() {
    return [
      MainFoodPage(),
      Container(child: Center(child: Text('nextpage')),),
      Container(child: Center(child: Text('nextpage2')),),
      Container(child: Center(child: Text('nextpage3')),),
    ];
  }*/
 /* List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.archivebox_fill ),
        title: ("rchive"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart_fill),
        title: ("cart "),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("me"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 100,
        child: BottomNavigationBar(
          selectedItemColor: AppColor.mainColor,
          unselectedItemColor: AppColor.yellowColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          onTap: onTapNav,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,size: 40),
            label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.archive,size: 40,),
              label: 'archive',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,size: 40,),
              label: 'shopping_cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,size: 40),
              label: 'me',
            ),
          ],
        ),
      ),
    );
  }
 /* @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }*/
}
