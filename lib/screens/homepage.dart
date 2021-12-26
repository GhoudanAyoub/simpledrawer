import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './otherpage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  String mainProfilePic =
      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  bool switchToWallet = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Navigation Drawer"),
            ),
            drawer: new Drawer(
                child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Soufiane "),
                  accountEmail: Text("Soufiane@email.com"),
                  currentAccountPicture: GestureDetector(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(mainProfilePic),
                      ),
                      onTap: () => print("Current User")),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://png.pngtree.com/thumb_back/fh260/background/20190828/pngtree-dark-vector-abstract-background-image_302715.jpg")),
                  ),
                ),
                switchToWallet == true ? getNextPage() : getDrawerList()
              ],
            ))));
  }

  Widget getNextPage() {
    return Container(
      height: 100,
      child: ListView(
        children: [
          ListTile(
              trailing: Icon(CupertinoIcons.back),
              onTap: () {
                setState(() {
                  switchToWallet = false;
                });
              }),
          Text("Your Balance is :"),
          Text("0.00")
        ],
      ),
    );
  }

  getDrawerList() {
    return Container(
      height: 100,
      child: ListView(
        children: [
          ListTile(
              title: Text("TEST Soufiane"),
              trailing: Icon(Icons.menu),
              onTap: () {
                setState(() {
                  switchToWallet = true;
                });
              }),
          ListTile(
              title: Text("About Page"),
              trailing: Icon(Icons.info),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => OtherPage("About Page"),
                ));
              }),
          ListTile(
              title: Text("Settings Page"),
              trailing: Icon(Icons.security),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => OtherPage("Settings Page"),
                ));
              }),
          Divider(
            thickness: 1.0,
          ),
          ListTile(
            title: Text("Close"),
            trailing: Icon(Icons.cancel),
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
