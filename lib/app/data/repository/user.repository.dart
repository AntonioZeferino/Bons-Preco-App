import 'package:bompreco/app/data/model/token.dart';
import 'package:bompreco/app/data/model/user.dart';
import 'package:bompreco/app/data/provider/user.provider.dart';
import 'package:get_storage/get_storage.dart';

class AuthUserRepository {
  final AuthUserProvider apiUser = AuthUserProvider();
  final box = GetStorage('BonsPreco');

  register(User user) async {
    Map? json = await apiUser.register(user);

    if (json != null) {
      return Token.fromJson(json as Map<String, dynamic>);
    } else {
      return Token();
    }
  }

  login(String user, String passe) async {
    Map? json = await apiUser.login(user, passe);

    if (json != null) {
      return Token.fromJson(json as Map<String, dynamic>);
    } else {
      return Token();
    }
  }

  logout(String token) async {
    bool json = await apiUser.logout(token);

    if (json) {
      return true;
    } else {
      return false;
    }
  }

  userMe(String? token) async {
    Map? json = await apiUser.me(token);

    if (json != null) {
      return User.fromJson(json as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  update(User user, String token) async {
    bool json = await apiUser.updateUser(user, token);
    if (json) {
      User? userNew = await userMe(token);

      if (userNew != null) {
        box.write('user', userNew.toJson());
      }
      return true;
    } else {
      return false;
    }
  }
}
