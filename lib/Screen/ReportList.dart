import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../custom/custom.dart';
import 'UpdateEntry.dart';

class ReportListed extends ConsumerStatefulWidget {
  const ReportListed({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportListedState();
}

class _ReportListedState extends ConsumerState<ReportListed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Report'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_sharp)),
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
                //   MainBottomsheet(context);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 19,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(left: 10, top: 10, right: 8.sp),
                    // width: 51.w,
                    // height: 15.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(2, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Container(
                            // color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(''),
                                PopupMenuButton(
                                    // add icon, by default "3 dot" icon
                                    // icon: Icon(Icons.book)
                                    itemBuilder: (context) {
                                  return [
                                    PopupMenuItem<int>(
                                      value: 0,
                                      child: Row(
                                        children: [
                                          Icon(Icons.edit,
                                              color: Color.fromARGB(
                                                  255, 138, 88, 247)),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Edit",
                                            style: TextStyle(
                                                letterSpacing: .5,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Gilroy",
                                                fontSize: 13.sp,
                                                color: Color.fromARGB(
                                                    255, 138, 88, 247)
                                                //color: Color.fromARGB(255, 255, 0, 98)
                                                //color: Color(0xffffffff)
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Row(
                                        children: [
                                          Icon(Icons.delete,
                                              color: Color.fromARGB(
                                                  255, 138, 88, 247)),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Delete",
                                            style: TextStyle(
                                                letterSpacing: .5,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Gilroy",
                                                fontSize: 13.sp,
                                                color: Color.fromARGB(
                                                    255, 138, 88, 247)
                                                //color: Color.fromARGB(255, 255, 0, 98)
                                                //color: Color(0xffffffff)
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ];
                                }, onSelected: (value) {
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
                                }),
                                // IconButton(

                                //   icon: Icon(
                                //     Icons.more_vert_outlined,
                                //     size: 25,
                                //   ),
                                //  // color: Colors.white,
                                //   onPressed: () {
                                //     //   MainBottomsheet(context);
                                //   },
                                // ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Head',
                                        style: TextStyle(
                                          letterSpacing: .5,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Gilroy",
                                          fontSize: 13.sp,
                                          // color: Color.fromARGB(255, 138, 88, 247)
                                          //color: Color.fromARGB(255, 255, 0, 98)
                                          //color: Color(0xffffffff)
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Sub Head',
                                        style: TextStyle(
                                          letterSpacing: .5,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Gilroy",
                                          fontSize: 13.sp,
                                          // color: Color.fromARGB(255, 138, 88, 247)
                                          //color: Color.fromARGB(255, 255, 0, 98)
                                          //color: Color(0xffffffff)
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Description',
                                        style: TextStyle(
                                          letterSpacing: .5,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Gilroy",
                                          fontSize: 13.sp,
                                          // color: Color.fromARGB(255, 138, 88, 247)
                                          //color: Color.fromARGB(255, 255, 0, 98)
                                          //color: Color(0xffffffff)
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Files',
                                        style: TextStyle(
                                          letterSpacing: .5,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Gilroy",
                                          fontSize: 13.sp,
                                          // color: Color.fromARGB(255, 138, 88, 247)
                                          //color: Color.fromARGB(255, 255, 0, 98)
                                          //color: Color(0xffffffff)
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Date',
                                        style: TextStyle(
                                          letterSpacing: .5,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Gilroy",
                                          fontSize: 13.sp,
                                          // color: Color.fromARGB(255, 138, 88, 247)
                                          //color: Color.fromARGB(255, 255, 0, 98)
                                          //color: Color(0xffffffff)
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Jagadish',
                                        style: TextStyle(
                                            // letterSpacing: .5,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Gilroy",
                                            fontSize: 12.sp,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Jagadish1234',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Gilroy",
                                            fontSize: 12.sp,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        '1234',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Gilroy",
                                            fontSize: 12.sp,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Gilroy",
                                            fontSize: 12.sp,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                    SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        '15-04-2021',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Gilroy",
                                            fontSize: 12.sp,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            //width: 300,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  children: [
                                    Icon(
                                      Icons.notifications,
                                      color: Color.fromARGB(255, 138, 88, 247),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'N',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Gilroy",
                                          fontSize: 12.sp,
                                          color: Colors.grey[700]),
                                    ),
                                  ],
                                )),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.traffic,
                                        color:
                                            Color.fromARGB(255, 138, 88, 247),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'M',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Gilroy",
                                            fontSize: 12.sp,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset('Assets/stripe.png',
                                          height: 40,
                                          // width: 40,
                                          color: Color.fromARGB(
                                              255, 138, 88, 247)),
                                      //  SizedBox(height: 6,),
                                      Text(
                                        'P',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Gilroy",
                                            fontSize: 12.sp,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Icon(
                                      Icons.local_offer,
                                      color: Color.fromARGB(255, 138, 88, 247),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'null',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Gilroy",
                                          fontSize: 12.sp,
                                          color: Colors.grey[700]),
                                    ),
                                  ],
                                )),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Icon(
                                      Icons.discount,
                                      color: Color.fromARGB(255, 138, 88, 247),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'null',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Gilroy",
                                          fontSize: 12.sp,
                                          color: Colors.grey[700]),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ),
                          //  SizedBox(
                          //           height: 10,
                          //         ),
                          //    Container(
                          //   //width: 300,
                          //   child: Row(
                          //     children: [
                          //       Expanded(
                          //         child:   Text(
                          //               '1234',
                          //               style: TextStyle(
                          //                   fontWeight: FontWeight.w500,
                          //                   fontFamily: "Gilroy",
                          //                   fontSize: 12.sp,
                          //                   color: Colors.grey[700]),
                          //             ),
                          //       ),
                          //       Expanded(
                          //         child:Icon(Icons.notifications)
                          //       ),
                          //        Expanded(
                          //         child:Icon(Icons.notifications)
                          //       ),
                          //        Expanded(
                          //         child:Icon(Icons.notifications)
                          //       ),
                          //        Expanded(
                          //         child:Icon(Icons.notifications)
                          //       ),

                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
