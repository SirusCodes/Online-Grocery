import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_grocery/provider/cart_provider.dart';

class AddToCardButton extends ConsumerWidget {
  AddToCardButton({Key key, @required this.title, @required this.image})
      : super(key: key);

  final String title;
  final Image image;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _countProvider = watch(cartProvider);
    return _countProvider.getItemCount(title) <= 0
        ? RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () => _countProvider.incrementItem(title, image),
            child: Text("Add to Cart"),
          )
        : Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  padding: const EdgeInsets.all(1),
                  shape: CircleBorder(),
                  onPressed: () => _countProvider.decrementItem(title),
                  child: Icon(Icons.remove),
                ),
              ),
              Expanded(
                  child: Center(
                      child: Text(
                _countProvider.getItemCount(title).toString(),
                style: Theme.of(context).textTheme.headline5,
              ))),
              Expanded(
                child: RaisedButton(
                  padding: const EdgeInsets.all(1),
                  shape: CircleBorder(),
                  onPressed: () => _countProvider.incrementItem(title, image),
                  child: Icon(Icons.add),
                ),
              )
            ],
          );
  }
}
