import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineshopflutter/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget _buildDrawerBack() => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 203, 236, 241),
          Colors.white,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 0.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 8.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Text(
                        "Outfit Shop",
                        style: TextStyle(
                            fontSize: 34.0, fontWeight: FontWeight.bold),
                      ),
                      top: 16.0,
                      left: 0.0,
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 20.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Hello,",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(child: Text(
                            "Log-in or Sign-in >",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: (){

                          },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Home"),
              DrawerTile(Icons.list, "Products"),
              DrawerTile(Icons.location_on, "Shop Location"),
              DrawerTile(Icons.playlist_add_check, "My Orders"),
            ],
          )
        ],
      ),
    );
  }
}
