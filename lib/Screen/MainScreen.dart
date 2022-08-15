import 'package:conrev/Screen/display.dart';
import 'package:conrev/Screen/reportscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import '../custom/custom.dart';
import 'entryscreen.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conrev'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Customcolor().blacktheme,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert_outlined,
              size: 25,
            ),
            color: Colors.white,
            onPressed: () {
              MainBottomsheet(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(child: EntryScreen()),
    );
  }

  MainBottomsheet(
    BuildContext context,
  ) {
    //  final typestate = ref.watch(getprofileproduct);
    return showModalBottomSheet(
      isScrollControlled: true,
      //   enableDrag: true,
      //   expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          //  margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.zero,
              bottomRight: Radius.zero,
            ),
          ),

          //height: 75.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      height: 5,
                      width: 10.w,

                      margin: EdgeInsets.symmetric(vertical: 8.sp),
                      //child:
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  // height: 80,
                  //  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Conrev',
                        style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Gilroy",
                          fontSize: 18.sp,
                          //color: Color(0xffffffff)
                        ),
                      )
                      //  Container(
                      //    margin: EdgeInsets.all(10),
                      //    width: 95.w,
                      //    child:
                      //  ),
                    ],
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);

                    // Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 11.sp),
                    child: Text('Entry',
                        style: TextStyle(
                            letterSpacing: 1,
                            fontFamily: 'Gilroy',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1A1A1A))),
                  ),
                ),
                Divider(thickness: 1),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: ((context) => Report())),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 11.sp),
                    child: Text(
                      'Report',
                      style: TextStyle(
                        letterSpacing: 1,
                        fontFamily: 'Gilroy',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1A1A1A),
                      ),
                    ),
                  ),
                ),
                Divider(thickness: 1),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Display())));

                    // Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 11.sp),
                    child: Text(
                      'Display',
                      style: TextStyle(
                        letterSpacing: 1,
                        fontFamily: 'Gilroy',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1A1A1A),
                      ),
                    ),
                  ),
                ),
                Divider(thickness: 1),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);

                    // Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 11.sp),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        letterSpacing: 1,
                        fontFamily: 'Gilroy',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1A1A1A),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10)
              ])
            ],
          ),
        ),
      ),
    );
  }
}
