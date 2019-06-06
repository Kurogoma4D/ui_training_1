import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<AppStateModel>(builder: (_, model, child) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        curve: Curves.easeIn,
        width: size.width,
        height: size.height,
        padding: model.isMenuOpened
            ? EdgeInsets.symmetric(vertical: size.height / 4)
            : EdgeInsets.all(0),
        child: GestureDetector(
          onTap: model.isMenuOpened ? model.toggleMenu : null,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue[50],
              borderRadius: model.isMenuOpened
              ? BorderRadius.all(Radius.circular(24))
              : BorderRadius.zero,
              boxShadow: [
                BoxShadow(
                    color: Colors.black38,
                    blurRadius: 24.0,
                    offset: Offset(0, 12))
              ],
            ),
          ),
        ),
        transform: model.isMenuOpened
            ? Matrix4.translationValues(size.width / 2, 0, 0)
            : Matrix4.translationValues(0, 0, 0),
      );
    });
  }
}
