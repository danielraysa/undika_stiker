import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class MyDrawer extends StatelessWidget {
  static const TextStyle _menuTextColor = TextStyle(
    color: Colors.red,
    fontSize: 14.0,
    fontWeight:FontWeight.w500,
  );

  static const IconThemeData _iconColor = IconThemeData(
    color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Universitas Dinamika",
              style: TextStyle(
                fontSize:20.0,
              ),),
            accountEmail: Text("www.dinamika.ac.id"),
            // currentAccountPicture: Image.asset('assets/images/logo.png'),
          ),
          ListTile(
            leading: IconTheme(
              data: _iconColor,
              child: Icon(Icons.share),
            ),
            title: Text("Share",style: _menuTextColor),
            onTap: () {
              // Share.share("Undika WAStickers ","https://play.google.com/store/apps/details?id=com.dinamika.undika_wastiker","text/plain");
              Share.share("https://play.google.com/store/apps/details?id=com.dinamika.undika_wastiker", subject: "Bagikan Undika WAStickers");
            },
          ),
          ListTile(
            leading: IconTheme(
              data: _iconColor,
              child: Icon(Icons.rate_review),
            ),
            title: Text("Rating & Review",style: _menuTextColor),
            onTap: () async {
              Navigator.of(context).pop();
              const url = 'https://play.google.com/store/apps/details?id=com.dinamika.undika_wastiker';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not open App';
              }
            },
          ),
          
        ],
      ),
    );
  }
}