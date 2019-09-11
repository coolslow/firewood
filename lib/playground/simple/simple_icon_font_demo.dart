import 'package:firewood/common/font.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

class IconFontDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("图文混排"),
      body: Column(
        children: <Widget>[
//          Container(
//            margin: EdgeInsets.only(top: 20),
//            child: Text("下面两个Icon Font来自两个不同的ttf",
//                style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
//          ),
          Container(
              margin: EdgeInsets.only(top: 20),
              height: 30,
              width: double.infinity,
              child:
                  Icon(FFontFamilyTb.arrowDown, color: Colors.green, size: 30)),
          Container(
              margin: EdgeInsets.only(top: 20),
              height: 30,
              width: double.infinity,
              child:
                  Icon(FFontFamilyTpp.redPacket, color: Colors.red, size: 30)),
//          Container(
//            margin: EdgeInsets.only(top: 30),
//            child: Text("下面是在Text中时候用Icon Font",
//                style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
//          ),
          Container(
              margin: EdgeInsets.only(top: 20),
              height: 30,
              width: double.infinity,
              child: Center(
                child: Text(
                  "方${FFontFamilyTb.arrowUpU}向${FFontFamilyTb.arrowDownU}箭${FFontFamilyTb.arrowLeftU}头${FFontFamilyTb.arrowRightU}",
                  style: TextStyle(
                      fontFamily: FFontFamilyTpp.family,
                      color: Colors.lightBlueAccent,
                      fontSize: 20),
                ),
              )),
          Container(
              margin: EdgeInsets.only(top: 20),
              height: 30,
              width: double.infinity,
              child: Center(
                child: Text(
                  "红${FFontFamilyTpp.redPacketU}包",
                  style: TextStyle(
                      fontFamily: FFontFamilyTpp.family,
                      color: Colors.red,
                      fontSize: 20),
                ),
              )),
        ],
      ),
    );
  }
}
