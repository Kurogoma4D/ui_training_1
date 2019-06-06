import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_training_1/model.dart';
import 'package:ui_training_1/page_list.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Transition Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<AppStateModel>(
        builder: (_) => AppStateModel(3),
        child: Material(
          type: MaterialType.transparency,
          child: MyHomePage(title: 'Flutter Demo Home Page')),
      ),
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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[600],
        ),
        Container(
          width: MediaQuery.of(context).size.width/2,
          child: PageList(),
        ),
        Consumer<AppStateModel>(
          builder: (_, model, child) {
            return SingleChildScrollView(
              controller: _scrollController,
              physics: model.isMenuOpened
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Page1(),
                  Page2(),
                  Page3(),
                ],
              ),
            );
          },
        ),
        SafeArea(
          child: Consumer<AppStateModel>(builder: (_, model, child) {
            return RawMaterialButton(
              child: Container(
                height: 24,
                width: 24,
                child: Icon(Icons.menu),
              ),
              onPressed: model.toggleMenu,
            );
          }),
        ),
      ],
    );
  }

  void _scrollListener() {
    var model = Provider.of<AppStateModel>(context);
    double positionRate =
        _scrollController.offset / _scrollController.position.maxScrollExtent;  
    model.setIndex((positionRate * model.pageNum).toInt());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
