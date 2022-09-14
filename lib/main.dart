import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:undika_stiker/drawer.dart';
import 'package:undika_stiker/sticker_list.dart';
import 'package:in_app_update/in_app_update.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // final String title = 'Undika WAStickers';

  bool isDarkMode() {
    final darkMode = WidgetsBinding.instance.window.platformBrightness;
    if (darkMode == Brightness.dark) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Map<int, Color> colorCodes = {
      50: Color.fromRGBO(219, 29, 29, .1),
      100: Color.fromRGBO(219, 29, 29, .2),
      200: Color.fromRGBO(219, 29, 29, .3),
      300: Color.fromRGBO(219, 29, 29, .4),
      400: Color.fromRGBO(219, 29, 29, .5),
      500: Color.fromRGBO(219, 29, 29, .6),
      600: Color.fromRGBO(219, 29, 29, .7),
      700: Color.fromRGBO(219, 29, 29, .8),
      800: Color.fromRGBO(219, 29, 29, .9),
      900: Color.fromRGBO(219, 29, 29, 1),
    };

    MaterialColor materialColor= new MaterialColor(0XFFDB1D1D, colorCodes);
    return MaterialApp(
      // title: title,
      theme: ThemeData(
        useMaterial3: true,
        brightness: isDarkMode() ? Brightness.dark : Brightness.light,
        /* appBarTheme: AppBarTheme(
          backgroundColor: Colors.red, 
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 16.0), 
          actionsIconTheme: IconThemeData(color: Colors.white), 
          iconTheme: IconThemeData(color: Colors.white),
        ), */
        primaryColor: Colors.red[600],
        primarySwatch: materialColor,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    checkForUpdate();
    //AdmobAd.initialize();
    //AdmobAd.showBannerAd();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkForUpdate() async {
    if (!kDebugMode) {
      InAppUpdate.checkForUpdate().then((info) {
        if(info.updateAvailability == UpdateAvailability.updateAvailable){
          InAppUpdate.performImmediateUpdate().catchError((e) => print(e.toString()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /* List<Widget> fakeBottomButtons = new List<Widget>();
    fakeBottomButtons.add(
      Container(
        height: 50.0,
      ),
    ); */
    return Scaffold(
      appBar: AppBar(
        title: Text('Undika WAStickers'),
        actions: [
          IconButton(
            // color: Colors.white,
            icon: Icon(Icons.share),
            onPressed: () => Share.share("https://play.google.com/store/apps/details?id=com.dinamika.undika_wastiker", subject: "Bagikan Undika WAStickers"),
          )
        ],
      ),
      body: StaticContent(),
      // drawer: Drawer(
      //   child: MyDrawer(),
      // ),
      //persistentFooterButtons: fakeBottomButtons,
    );
  }
}
