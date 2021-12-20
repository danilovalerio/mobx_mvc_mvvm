import 'package:flutter/material.dart';
import 'package:mobx_mvc_mvvm/stores/app.store.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(store.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(store.picture),
              Text(store.name),
              Text(store.email),
            ],
          ),
        ));
  }
}
