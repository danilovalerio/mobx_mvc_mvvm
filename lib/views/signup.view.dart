import 'package:flutter/material.dart';
import 'package:mobx_mvc_mvvm/controllers/signup.controller.dart';
import 'package:mobx_mvc_mvvm/stores/app.store.dart';
import 'package:mobx_mvc_mvvm/view-models/signup.viewmodel.dart';
import 'package:mobx_mvc_mvvm/views/home.view.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();

  final _controller = SignupController();

  var model = SignupViewModel();


  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text("Cadastre-se"),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nome inválido';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.name = val!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.email = val!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Senha inválida';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.password = val!;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                model.ocupado
                    ? Center(
                        child: Container(
                          child: const CircularProgressIndicator(
                            backgroundColor: Colors.black,
                          ),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                          }

                          setState(() {
                            _controller.create(model).then((data) {
                              store.setUser(
                                data.name,
                                data.email,
                                data.picture,
                                data.token,
                              );
                              setState(() {});
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeView()));
                            });
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Nova Carteira',
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
