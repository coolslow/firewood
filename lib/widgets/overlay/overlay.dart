import 'package:firewood/common/utils/size_compat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FOverlay {
  OverlayEntry overlayEntry;

  void open(BuildContext context, Widget child) {
    if (overlayEntry != null) {
      overlayEntry.remove();
      overlayEntry = null;
      return;
    }
    overlayEntry = OverlayEntry(builder: (BuildContext context) {
      return Material(
          color: Colors.transparent,
          child: GestureDetector(
              onTap: () {
                print("======>close");
                close();
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: SizeCompat.width(),
                height: SizeCompat.height(),
                child: Column(children: <Widget>[
                  Container(
                    width: 150,
                    height: 60,
                    color: Colors.pinkAccent,
                    child: ListTile(
                      onTap: (){
                        print("onClick发起群聊");
                      },
                      leading: Icon(Icons.add, color: Colors.white),
                      title:
                          Text("发起群聊", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 60,
                    color: Colors.pinkAccent,
                    child: ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title:
                          Text("发起群聊", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 60,
                    color: Colors.pinkAccent,
                    child: ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title:
                          Text("发起群聊", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 60,
                    color: Colors.pinkAccent,
                    child: ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title:
                          Text("发起群聊", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ]),
              )));
    });
    Overlay.of(context).insert(overlayEntry);
  }

  void close() {
    if (overlayEntry != null) {
      overlayEntry.remove();
      overlayEntry = null;
      return;
    }
  }
}
