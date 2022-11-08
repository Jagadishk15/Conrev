import 'package:conrev/Utils/url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImageWidget extends ConsumerWidget {
  final String url;
  const ImageWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (url.isEmpty) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'File',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 12,
            letterSpacing: .5,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        Image.network(
          URL.imageBase + url,
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
