import 'package:conrev/Screen/UpdateEntry.dart';
import 'package:conrev/helper/display_helper.dart';
import 'package:conrev/model/display.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class PopUpMenu extends ConsumerWidget {
  final Item e;
  const PopUpMenu({Key? key, required this.e}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logic = ref.read(displaytHelper);

    return Row(
      children: [
        // if (e.priority != null && e.priority != 0)
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: logic.getPriorityColor(e.priority),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              logic.getPriorityString(e.priority),
              style: TextStyle(
                letterSpacing: .5,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Spacer(),
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              // PopupMenuItem<int>(
              //   value: 1,
              //   child: Row(
              //     children: [
              //       Icon(Icons.check, color: Color.fromARGB(255, 138, 88, 247)),
              //       SizedBox(width: 10),
              //       Text(
              //         "Save",
              //         style: TextStyle(
              //           letterSpacing: .5,
              //           fontWeight: FontWeight.w600,
              //           fontFamily: "Gilroy",
              //           fontSize: 13.sp,
              //           color: Color.fromARGB(255, 138, 88, 247),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // PopupMenuItem<int>(
              //   value: 0,
              //   child: Row(
              //     children: [
              //       Icon(Icons.edit, color: Color.fromARGB(255, 138, 88, 247)),
              //       SizedBox(width: 10),
              //       Text(
              //         "Edit",
              //         style: TextStyle(
              //           letterSpacing: .5,
              //           fontWeight: FontWeight.w600,
              //           fontFamily: "Gilroy",
              //           fontSize: 13.sp,
              //           color: Color.fromARGB(255, 138, 88, 247),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.delete,
                        color: Color.fromARGB(255, 138, 88, 247)),
                    SizedBox(width: 10),
                    Text(
                      "Delete",
                      style: TextStyle(
                        letterSpacing: .5,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Gilroy",
                        fontSize: 13.sp,
                        color: Color.fromARGB(255, 138, 88, 247),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          onSelected: (value) {
            if (value == 0) {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return UpdateEntry();
              })));
              print("My account menu is selected.");
            } else if (value == 1) {
              print("Settings menu is selected.");
            } else if (value == 2) {
              print("Logout menu is selected.");
            }
          },
        ),
      ],
    );
  }
}
