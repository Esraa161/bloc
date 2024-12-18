import 'package:bloc_api/dynamic%20theme/settings_page.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        //centerTitle: true,
        actions: [
          IconButton(onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>SettingsPage()));
          },
              icon: Icon(Icons.settings),)
        ],
      ),
      body: Center(
        child: Text("Home",
        style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
