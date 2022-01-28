import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:undika_stiker/drawer.dart';
import 'package:undika_stiker/sticker_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // final String title = 'Undika WAStickers';

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
    //AdmobAd.initialize();
    //AdmobAd.showBannerAd();
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
            icon: Icon(Icons.share),
            onPressed: (){
              Share.share("https://play.google.com/store/apps/details?id=com.dinamika.undika_wastiker", subject: "Bagikan Undika WAStickers");
            },
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
