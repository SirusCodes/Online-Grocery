import 'package:flutter/material.dart';

class AddToCardButton extends StatefulWidget {
  AddToCardButton({Key key}) : super(key: key);

  @override
  _AddToCardButtonState createState() => _AddToCardButtonState();
}

class _AddToCardButtonState extends State<AddToCardButton> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return _count <= 0
        ? RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: _increment,
            child: Text("Add to Cart"),
          )
        : Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  padding: const EdgeInsets.all(1),
                  shape: CircleBorder(),
                  onPressed: _decrement,
                  child: Icon(Icons.remove),
                ),
              ),
              Expanded(
                  child: Center(
                      child: Text(
                _count.toString(),
                style: Theme.of(context).textTheme.headline5,
              ))),
              Expanded(
                child: RaisedButton(
                  padding: const EdgeInsets.all(1),
                  shape: CircleBorder(),
                  onPressed: _increment,
                  child: Icon(Icons.add),
                ),
              )
            ],
          );
  }

  _increment() {
    setState(() {
      _count++;
    });
  }

  _decrement() {
    setState(() {
      _count--;
    });
  }
}
