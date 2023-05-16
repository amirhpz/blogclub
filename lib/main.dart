import 'package:blogclub/article.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Color primaryTextColor = Color(0xff0d253c);
    const Color secondaryTextColor = Color.fromARGB(255, 3, 4, 8);
    const Color primaryColor = Color(0xff376aed);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: const ColorScheme.light(
          background: Color(0xfffbfcff),
          primary: primaryColor,
          onPrimary: Colors.white,
          surface: Colors.white,
          onSurface: primaryTextColor,
          onBackground: primaryTextColor,
        ),
        appBarTheme: const AppBarTheme(
          titleSpacing: 32,
          backgroundColor: Colors.white,
          foregroundColor: primaryTextColor,
          elevation: 0,
        ),
        snackBarTheme: const SnackBarThemeData(backgroundColor: primaryColor),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.w400,
                color: primaryColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
        textTheme: const TextTheme(
          headline6: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: primaryTextColor),
          subtitle1: TextStyle(
              fontWeight: FontWeight.w200,
              fontFamily: FontFamily.avenir,
              color: secondaryTextColor,
              fontSize: 18),
          subtitle2: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: FontFamily.avenir,
              color: primaryTextColor,
              fontSize: 14),
          bodyText2: TextStyle(
              fontFamily: FontFamily.avenir,
              fontSize: 12,
              color: secondaryTextColor),
          bodyText1: TextStyle(
              fontFamily: FontFamily.avenir,
              fontSize: 14,
              color: primaryTextColor),
          headline4: TextStyle(
            color: primaryTextColor,
            fontFamily: FontFamily.avenir,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          headline5: TextStyle(
            fontFamily: FontFamily.avenir,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: secondaryTextColor,
          ),
          caption: TextStyle(
            fontFamily: FontFamily.avenir,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: Color(0xff0047CC),
          ),
        ),
      ),
      //   home: Stack(
      //     children: [
      //       const Positioned.fill(child: HomeScreen()),
      //       Positioned(
      //         bottom: 0,
      //         right: 0,
      //         left: 0
      //         child: _BottomNavigation(),
      //       )
      //     ],
      //   ),
      // );
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;
const double bottomNavHeight = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _articleKey = GlobalKey();
  final GlobalKey<NavigatorState> _searchKey = GlobalKey();
  final GlobalKey<NavigatorState> _menuKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    menuIndex: _searchKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(
        () {
          selectedScreenIndex = _history.last;
          _history.removeLast();
        },
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavHeight,
              child: IndexedStack(
                index: selectedScreenIndex,
                children: [
                  _Navigator(_homeKey, homeIndex, HomeScreen()),
                  _Navigator(_articleKey, articleIndex, ArticleScreen()),
                  _Navigator(_searchKey, searchIndex, SearchScreen()),
                  _Navigator(_menuKey, menuIndex, ProfileScreen()),
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: _BottomNavigation(
                selectedIndex: selectedScreenIndex,
                onTap: (int index) {
                  setState(
                    () {
                      _history.remove(selectedScreenIndex);
                      _history.add(selectedScreenIndex);
                      selectedScreenIndex = index;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: ((context) => Offstage(
                    offstage: selectedScreenIndex != index,
                    child: child,
                  )),
            ),
          );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;
  const _BottomNavigation(
      {super.key, required this.onTap, required this.selectedIndex});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: bottomNavHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      color: const Color(0xff2D2D2D).withOpacity(0.14))
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavigationItem(
                    iconFileName: 'Home.png',
                    activeIconeFileName: 'homeActive.png',
                    onTap: () {
                      onTap(homeIndex);
                    },
                    isActive: selectedIndex == homeIndex,
                    title: 'Home',
                  ),
                  _BottomNavigationItem(
                    iconFileName: 'Articles.png',
                    activeIconeFileName: 'articleActive.png',
                    onTap: () {
                      onTap(articleIndex);
                    },
                    isActive: selectedIndex == articleIndex,
                    title: 'Articles',
                  ),
                  Expanded(child: Container()),
                  _BottomNavigationItem(
                    iconFileName: 'Search.png',
                    activeIconeFileName: 'searchActive.png',
                    onTap: () {
                      onTap(searchIndex);
                    },
                    isActive: selectedIndex == searchIndex,
                    title: 'Search',
                  ),
                  _BottomNavigationItem(
                    iconFileName: 'Menu.png',
                    activeIconeFileName: 'menuActive.png',
                    onTap: () {
                      onTap(menuIndex);
                    },
                    isActive: selectedIndex == menuIndex,
                    title: 'Menu',
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  color: const Color(0xff376AED),
                  borderRadius: BorderRadius.circular(32.5),
                ),
                child: Image.asset('assets/img/icons/plus.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Search',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  @override
  final String iconFileName;
  final String activeIconeFileName;
  final String title;
  final bool isActive;
  final Function() onTap;

  const _BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconeFileName,
      required this.title,
      required this.onTap,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/icons/${isActive ? activeIconeFileName : iconFileName}',
              width: 24,
              height: 24,
            ),
            Text(
              title,
              style: themeData.textTheme.caption!.apply(
                  color: isActive
                      ? themeData.colorScheme.primary
                      : themeData.textTheme.caption!.color),
            )
          ],
        ),
      ),
    );
  }
}
