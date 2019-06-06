import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class PageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(builder: (_, model, child) {
      return Align(
        alignment: Alignment.centerLeft,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: model.pageNum,
          shrinkWrap: true,
          itemBuilder: (context, _index) {
            return Row(
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(milliseconds: 150),
                  curve: Curves.easeIn,
                  margin: const EdgeInsets.all(16),
                  width: _index == model.pageIndex ? 24 : 20,
                  height: _index == model.pageIndex ? 24 : 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 4, color: Colors.white30),
                      color: Colors.lightBlue[100]),
                ),
                Expanded(
                  child: Container(
                    height: 32,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("PAGE$_index", style: TextStyle(color: Colors.white, fontSize: 12),)),
                  ),
                )
              ],
            );
          },
        ),
      );
    });
  }
}
