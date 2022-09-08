import 'package:conrev/helper/display_helper.dart';
import 'package:conrev/model/display.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Description extends HookConsumerWidget {
  final Item e;
  const Description({Key? key, required this.e}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logic = ref.read(displaytHelper);

    useEffect(() {
      logic.description = TextEditingController(text: e.description);
      return;
    });

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: TextField(
        controller: logic.description,
        keyboardType: TextInputType.multiline,
        style: TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 14,
          letterSpacing: .5,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: ' Description',
          hintStyle: TextStyle(
            color: Color(0xffABB4BD),
            fontFamily: 'Gilroy',
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          contentPadding: EdgeInsets.all(5),
        ),
      ),
    );
  }
}
