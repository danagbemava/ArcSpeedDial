import 'package:flutter/material.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isShowDial = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _getBodyWidget(),
      floatingActionButton: _getFloatingActionButton(),
    );
  }

  Widget _getFloatingActionButton() {
    return SpeedDialMenuButton(
      //if needed to close the menu after clicking sub-FAB
      isShowSpeedDial: _isShowDial,
      //manually open or close menu
      updateSpeedDialStatus: (isShow) {
        //return any open or close change within the widget
        this._isShowDial = isShow;
      },
      animationDuration: Duration(milliseconds: 500),
      //general init
      isMainFABMini: false,
      mainMenuFloatingActionButton: MainMenuFloatingActionButton(
          mini: false,
          child: Icon(Icons.menu),
          onPressed: () {},
          closeMenuChild: Icon(Icons.close),
          closeMenuForegroundColor: Colors.white,
          closeMenuBackgroundColor: Colors.red),
      floatingActionButtonWidgetChildren: <FloatingActionButton>[
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.volume_off),
          onPressed: () {
            //if need to close menu after click
            _isShowDial = false;
            setState(() {});
          },
          backgroundColor: Colors.pink,
        ),
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.volume_down),
          onPressed: () {
            //if need to toggle menu after click
            _isShowDial = !_isShowDial;
            setState(() {});
          },
          backgroundColor: Colors.orange,
        ),
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.volume_up),
          onPressed: () {
            //if no need to change the menu status
          },
          backgroundColor: Colors.deepPurple,
        ),
      ],
      isSpeedDialFABsMini: true,
      paddingBtwSpeedDialButton: 30.0,
    );
  }

  Widget _getBodyWidget() {
    return Container();
  }
}
