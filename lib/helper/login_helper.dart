import 'package:conrev/Screen/MainScreen.dart';
import 'package:conrev/Utils/Utils.dart';
import 'package:conrev/Utils/url.dart';
import 'package:conrev/service/api.dart';
import 'package:conrev/service/cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginHelper = ChangeNotifierProvider((ref) => LoginHelper());

class LoginHelper extends ChangeNotifier {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void login(BuildContext context) async {
    try {
      if (username.text.isEmpty || password.text.isEmpty)
        return Utils().toast(msg: 'Please fill all fields');

      Utils().showLoader(context);

      String body = 'username=${username.text}&password=${password.text}';
      String url = URL.login + body;

      String token = API().createAccessToken(
        username: "Admin",
        password: "Abcd1234",
      );

      await Cache().setAccessToken(token);

      var response = await API().post(url);

      Utils().dismissLoader(context);

      Utils().toast(msg: response['message']);

      if (response['message'] == "Invalid login") {
      } else {
        await Cache().setLogin(true);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => MainScreen()),
          (route) => false,
        );
      }
    } catch (e) {
      Utils().dismissLoader(context);
      Utils().toast(msg: e.toString());
    }
  }
}
