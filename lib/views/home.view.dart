import 'package:flutter/material.dart';
import 'package:mobx_mvc_mvvm/stores/app.store.dart';

class HomeView extends StatelessWidget {
  var store = AppStore();

  HomeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Hello from Home"),
      ),
    );
  }
}
