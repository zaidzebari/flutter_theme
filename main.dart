import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'all/app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyThemeProvider()),
      ],
      child: StartApp(),
    );
  }
}

class StartApp extends StatelessWidget {
  const StartApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: AppTheme.dark(),
      theme: provider.index == 0
          ? AppTheme.dark()
          : provider.index == 1
              ? AppTheme.light()
              : AppTheme.white(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RaisedButton(
            child: Text('Dark'),
            onPressed: () {
              provider.dark();
            },
          ),
          RaisedButton(
            child: Text('Blue'),
            onPressed: () {
              provider.blue();
            },
          ),
          RaisedButton(
            child: Text('Light'),
            onPressed: () {
              provider.light();
            },
          ),
        ],
      )),
    );
  }
}

class MyThemeProvider extends ChangeNotifier {
  int index = 0;
  void dark() {
    index = 0;
    notifyListeners();
  }

  void blue() {
    index = 1;
    notifyListeners();
  }

  void light() {
    index = 2;
    notifyListeners();
  }
}
