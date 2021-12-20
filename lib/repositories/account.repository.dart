import 'package:mobx_mvc_mvvm/models/user.model.dart';
import 'package:mobx_mvc_mvvm/view-models/signup.viewmodel.dart';

class AccountRepository {
  Future<UserModel> createAccount(SignupViewModel model) async {
    await Future.delayed(const Duration(microseconds: 1500));

    return UserModel(
        id: "1",
        name: "Danilo Valerio",
        email: "user@provedor.om",
        picture: "https://picsum.photos/200/200",
        role: "student",
        token: "xpto");
  }
}
