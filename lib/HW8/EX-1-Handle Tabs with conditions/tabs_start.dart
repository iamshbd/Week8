import 'package:flutter/material.dart';

class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(child: Text("Green Screen")),
    );
  }
}

class RedScreen extends StatelessWidget {
  const RedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: Text("Redscreen")),
    );
  }
}

class BlueScreen extends StatelessWidget {
  const BlueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text("Bluescreen")),
    );
  }
}

enum AppTabs { red, green, blue }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppTabs _currentTab = AppTabs.red;

  Widget get content {
    if (_currentTab == AppTabs.red) {
      return const RedScreen();
    }else if (_currentTab == AppTabs.blue) {
      return const BlueScreen();
    }else 
    return GreenScreen();
  
    
  }

  void _onTabSelected(AppTabs tab) {
    setState(() {
      _currentTab = tab;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tabs navigation")),
      body: content,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: ()=> _onTabSelected(AppTabs.red)),

            IconButton(
              icon: Icon(Icons.home),
              onPressed: ()=> _onTabSelected(AppTabs.blue),),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: ()=> _onTabSelected(AppTabs.green),),
              
              
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: App()));
}
