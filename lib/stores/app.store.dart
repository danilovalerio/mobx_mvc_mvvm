import 'package:mobx/mobx.dart';
///Nome do arquivo que será gerado por baixo dos panos
part 'app.store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  ///Info que tem que estar disponível na Home através do mobx
  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String picture = "https://placehole.it/200";

  @observable
  String token = "";

  ///Action é usado para passar novas informacoes para nossos observables
  @action
  void setUser(String pName, String pEmail, String pPicture, String pToken) {
    name = pName;
    email = pEmail;
    picture = pPicture;
    token = pToken;
  }
}