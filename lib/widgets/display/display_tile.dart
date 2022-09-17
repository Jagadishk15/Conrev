import 'package:conrev/model/display.model.dart';
import 'package:conrev/widgets/display/tile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisplayTile extends ConsumerWidget {
  final String strip;
  final int? count;
  final List<Item> list;

  const DisplayTile({
    Key? key,
    required this.strip,
    required this.count,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
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
      child: ExpansionTile(
        title: SizedBox.shrink(),
        leading: _Tile(title: strip, isDark: true),
        trailing: _Tile(title: "${count ?? 0}", isDark: false),
        expandedAlignment: Alignment.centerLeft,
        children: list.map((e) => TileItem(e: e)).toList(),
      ),
    );
  }
}

class _Tile extends ConsumerWidget {
  final String title;
  final bool isDark;

  const _Tile({
    Key? key,
    required this.isDark,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isDark ? Colors.grey[700] : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
