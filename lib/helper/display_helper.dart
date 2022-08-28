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
  List f=[];
  List p=[];
  void getdisplay(BuildContext context) async {
    try {
      // if (username.text.isEmpty || password.text.isEmpty)
        // return Utils().toast(msg: 'Please fill all fields');

      Utils().showLoader(context);

      String body = '/api/display';
      String url = URL.base + body;

      String token = API().createAccessToken(
        username: "Admin",
        password: "Abcd1234",
      );

      await Cache().setAccessToken(token);

      var response = await API().get(url);
   
      Utils().dismissLoader(context);
           
           
          //  for (var i = 0; i < response['data'].length; i++) {
          //      if ( response['data'][i]['strip']=="P") {
          //        print(response['data'][i]['strip'][i].length);
          //      }
              //   else if(response['data'][i]['strip']=="P") {

              //  }
              //   if () {
                 
              //  } else if() {
              //  } if () {
                 
              //  } else if() {
              //  }
          //   print( response['data'].length);
        //   }
      // Utils().toast(msg: response['data'].length);

      // if (response['message'] == "Entry updated") {
      //   //  Navigator.pushAndRemoveUntil(
      //   //   context,
      //   //   MaterialPageRoute(builder: (_) => MainScreen()),
      //   //   (route) => false,
      //   // );
      // } else {
      //  // await Cache().setLogin(true);
      //   // Navigator.pushAndRemoveUntil(
      //   //   context,
      //   //   MaterialPageRoute(builder: (_) => MainScreen()),
      //   //   (route) => false,
      //   // );
      // }
    } catch (e) {
      Utils().dismissLoader(context);
      Utils().toast(msg: e.toString());
    }
  }
}
