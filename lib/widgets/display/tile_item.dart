import 'package:conrev/model/display.model.dart';
import 'package:conrev/widgets/display/Image.dart';
import 'package:conrev/widgets/display/description.dart';
import 'package:conrev/widgets/display/head.dart';
import 'package:conrev/widgets/display/k_name.dart';
import 'package:conrev/widgets/display/priority_pop_up.dart';
import 'package:conrev/widgets/display/sub_head.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TileItem extends ConsumerWidget {
  final Item e;
  const TileItem({Key? key, required this.e}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final logic = ref.read(displaytHelper);

    return ExpansionTile(
      childrenPadding: EdgeInsets.all(15),
      title: Text(e.name ?? ""),
      children: [
        PopUpMenu(e: e),
        SizedBox(height: 10),
        Head(e: e),
        SizedBox(height: 20),
        SubHead(e: e),
        SizedBox(height: 20),
        Description(e: e),
        SizedBox(height: 20),
        KName(e: e),
        SizedBox(height: 20),
        ImageWidget(url: e.file ?? ''),
      ],
    );
  }
}
