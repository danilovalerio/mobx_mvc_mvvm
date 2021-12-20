import 'package:mobx_mvc_mvvm/models/user.model.dart';
import 'package:mobx_mvc_mvvm/repositories/account.repository.dart';
import 'package:mobx_mvc_mvvm/view-models/signup.viewmodel.dart';

class SignupController {
  AccountRepository? repository;

  SignupController(){
    repository = AccountRepository();
  }

  Future<UserModel> create(SignupViewModel model) async {
    var user = await repository!.createAccount(model);
    return user;
  }

}
