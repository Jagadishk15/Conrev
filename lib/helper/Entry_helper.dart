import 'package:conrev/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Screen/entryScreen2.dart';

final entryHelper = ChangeNotifierProvider((ref) => EntryHelper());

class EntryHelper extends ChangeNotifier {
  TextEditingController head = TextEditingController();
  TextEditingController sub = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController Kw = TextEditingController();
  TextEditingController Swk = TextEditingController();
   TextEditingController Description = TextEditingController();
   validation(context){
     if (head.text.isEmpty || sub.text.isEmpty|| Description.text.isEmpty|| name.text.isEmpty)
        return Utils().toast(msg: 'Please fill all fields');
        else{
          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return EntryNextScreen(restorationId: 'main');
                          })));
        }
   }
   String? date;
   String? file;
   String? Strip;
   String? freq;
   String? notif;
}