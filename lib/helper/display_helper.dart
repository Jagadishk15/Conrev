import 'package:conrev/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Utils/url.dart';
import '../service/api.dart';
import '../service/cache.dart';

final displaytHelper = ChangeNotifierProvider((ref) => DisplayHelper());

class DisplayHelper extends ChangeNotifier {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void getreport(BuildContext context) async {
    try {
      // if (username.text.isEmpty || password.text.isEmpty)
        // return Utils().toast(msg: 'Please fill all fields');

      Utils().showLoader(context);

      String body = '/api/insert?head=1&subhead=2&stamp=&entry=afdsf&strip=P&freq=&s_date=&priority=2&esubkeyword=1&ekeyword%5B%5D=1&file=abd11.jpg';
      String url = URL.base + body;

      String token = API().createAccessToken(
        username: "Admin",
        password: "Abcd1234",
      );

      await Cache().setAccessToken(token);

      var response = await API().post(url);

      Utils().dismissLoader(context);

      Utils().toast(msg: response['message']);

      if (response['message'] == "Entry updated") {
        //  Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(builder: (_) => MainScreen()),
        //   (route) => false,
        // );
      } else {
       // await Cache().setLogin(true);
        // Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(builder: (_) => MainScreen()),
        //   (route) => false,
        // );
      }
    } catch (e) {
      Utils().dismissLoader(context);
      Utils().toast(msg: e.toString());
    }
  }
}
