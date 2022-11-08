import 'package:conrev/helper/display_helper.dart';
import 'package:conrev/model/display.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KName extends HookConsumerWidget {
  final Item e;
  const KName({Key? key, required this.e}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logic = ref.read(displaytHelper);

    useEffect(() {
      logic.kName = TextEditingController(text: e.kName);
      return;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'K Name',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 12,
            letterSpacing: .5,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: logic.kName,
          keyboardType: TextInputType.multiline,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 14,
            letterSpacing: .5,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.all(8),
          ),
        ),
      ],
    );
  }
}
