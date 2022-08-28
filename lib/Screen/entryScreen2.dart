import 'package:conrev/Screen/reportscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../custom/CustomDropdown.dart';
import '../custom/custom.dart';
import 'package:date_time_picker/date_time_picker.dart';

import 'display.dart';

class EntryNextScreen extends ConsumerStatefulWidget {
  final String? restorationId;
  const EntryNextScreen({Key? key, required this.restorationId})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EntryNextScreenState();
}

class _EntryNextScreenState extends ConsumerState<EntryNextScreen> {
  List list = [
    'L',
    "F",
    "S",
    "P",
    "T",
    "C"
  ];
  List list1 = [
    'N',
    "D",
    "A",
    'T',
    "W",
    "F",
    'M',
    "Q",
    "H",
    "Y"
  ];
  List list2 = [
    'H',
    "M",
    "L",
  ];
  
  String? name1;
  // String? name2 = 'P1';
  // String? name3 = 'P';
  // String? name4 = 'P';
//  @override
//   String? get restorationId => widget.restorationId;
//   DateTime selectedDate = DateTime.now();
//   final RestorableDateTime _selectedDate =
//       RestorableDateTime(

//         //DateTime.now()
//         DateTime(2021, 7, 25)
//         );
//   late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
//       RestorableRouteFuture<DateTime?>(
//     onComplete: _selectDate,
//     onPresent: (NavigatorState navigator, Object? arguments) {
//       return navigator.restorablePush(
//         _datePickerRoute,
//         arguments: _selectedDate.value.millisecondsSinceEpoch,
//       );
//     },
//   );

//   static Route<DateTime> _datePickerRoute(
//     BuildContext context,
//     Object? arguments,
//   ) {
//     return DialogRoute<DateTime>(
//       context: context,
//       builder: (BuildContext context) {
//         return DatePickerDialog(
//           restorationId: 'date_picker_dialog',
//           initialEntryMode: DatePickerEntryMode.calendarOnly,
//           initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
//           firstDate: DateTime(2021),
//           lastDate: DateTime(2022),
//         );
//       },
//     );
//   }

//   @override
//   void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
//     registerForRestoration(_selectedDate, 'selected_date');
//     registerForRestoration(
//         _restorableDatePickerRouteFuture, 'date_picker_route_future');
//   }

//   void _selectDate(DateTime? newSelectedDate) {
//     if (newSelectedDate != null) {
//       setState(() {
//         _selectedDate.value = newSelectedDate;
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text(
//               'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
//         ));
//       });
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conrev'),
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
              MainBottomsheet(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(left: 10, top: 10, right: 8.sp),
                        // width: 51.w,
                        height: 15.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(2, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                                height: double.infinity,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(9),
                                      bottomLeft: Radius.circular(9)),
                                  color: Colors.grey[400],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(
                                          2, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.discount,
                                    color: Color.fromARGB(255, 138, 88, 247),
                                  ),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              'Select',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Gilroy",
                                  fontSize: 16),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // CustomDropdown(
                //   image: Icon(
                //    Icons.local_offer,
                //     color: Color.fromARGB(255, 138, 88, 247),
                //   ),
                //   listed: list,
                //   listname: 'N',
                // ),
                CustomDropdown(
                  image: Image.asset('Assets/stripe.png',
                      width: 40, color: Color.fromARGB(255, 138, 88, 247)),
                  listed: list,
                  listname: 'P',
                ),
                CustomDropdown(
                  image: Icon(
                    Icons.notifications,
                    color: Color.fromARGB(255, 138, 88, 247),
                  ),
                  listed: list1,
                  listname: 'N',
                ),
                CustomDropdown(
                  image: Icon(
                    Icons.traffic,
                    color: Color.fromARGB(255, 138, 88, 247),
                  ),
                  listed: list2,
                  listname: 'Select Priority',
                ),
                // CustomDropdown(
                //   image: Icon(
                //     Icons.local_offer,
                //     color: Color.fromARGB(255, 138, 88, 247),
                //   ),
                //   listed: list,
                //   listname: 'name1',
                // ),
                datepicker(),
              ],
            )),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: ((context) {
              //   return EntryNextScreen();
              // })));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 60),
              width: 95.w,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(5),
                  color: Customcolor().blacktheme
                  // color: Color(0xff591B4C)
                  ),
              child: Center(
                  child: Text(
                'Submit',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Gilroy",
                    fontSize: 16),
              )),
            ),
          ),
        ],
      ),
    );
  }

  // Widget droupdownfield(String image, List listed, String? listname) {
  //   return Column(
  //     children: [
  //       SizedBox(
  //         height: 10,
  //       ),
  //       InkWell(
  //         onTap: () {},
  //         child: Container(
  //           margin: EdgeInsets.only(left: 10, top: 10, right: 8.sp),
  //           // width: 51.w,
  //           height: 15.w,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(9),
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.black12,
  //                 spreadRadius: 1,
  //                 blurRadius: 5,
  //                 offset: Offset(2, 2), // changes position of shadow
  //               ),
  //             ],
  //           ),
  //           child: Row(
  //             children: [
  //               Container(
  //                   height: double.infinity,
  //                   // width: 70,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.only(
  //                         topLeft: Radius.circular(9),
  //                         bottomLeft: Radius.circular(9)),
  //                     color: Colors.grey,
  //                     boxShadow: [
  //                       BoxShadow(
  //                         color: Colors.black12,
  //                         spreadRadius: 1,
  //                         blurRadius: 5,
  //                         offset: Offset(2, 2), // changes position of shadow
  //                       ),
  //                     ],
  //                   ),
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Image.asset(
  //                       image,
  //                       width: 40,
  //                     ),
  //                   )),
  //               SizedBox(
  //                 width: 10,
  //               ),
  //               Expanded(
  //                 child: DropdownButton(
  //                     isExpanded: false,
  //                     menuMaxHeight: 300,
  //                     //alignment: AlignmentGeometry.,
  //                     // hint: Padding(
  //                     //   padding: const EdgeInsets.only(left:18.0),
  //                     //   child:  Text("$_currentSugars"),
  //                     // ),
  //                     // alignment : AlignmentDirectional.bottomStart,
  //                     icon: Row(
  //                       //   mainAxisAlignment: MainAxisAlignment.start,
  //                       //  crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text("$name1"),

  //                         //  Padding(
  //                         //       padding: const EdgeInsets.only(right:18.0),
  //                         //    child: Icon(Icons.keyboard_arrow_down_sharp, color: Customcolor().blacktheme, size: 28),
  //                         //  ),
  //                       ],
  //                     ),
  //                     iconSize: 28,
  //                     elevation: 4,
  //                     underline: Container(),
  //                     items: listed.map<DropdownMenuItem<String>>((e) {
  //                       return DropdownMenuItem<String>(
  //                           // enabled: true,
  //                           // alignment : AlignmentDirectional.bottomStart,
  //                           value: e,
  //                           child: Text(e.toString()));
  //                     }).toList(),
  //                     onChanged: (String? value) {
  //                       setState(() {
  //                         name1 = value!;
  //                       });
  //                     }),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget datepicker() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            setState(() {});
            // _restorableDatePickerRouteFuture.present();
          },
          child: Container(
            margin: EdgeInsets.only(left: 10, top: 10, right: 8.sp),
            // width: 51.w,
            height: 15.w,
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
            child: Row(
              children: [
                Container(
                    height: double.infinity,
                    width: 50,
                    // width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(9),
                          bottomLeft: Radius.circular(9)),
                      color: Colors.grey[400],
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
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.calendar_today,
                            color: Color.fromARGB(255, 138, 88, 247)))),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DateTimePicker(
                    type: DateTimePickerType.date,
                    dateMask: 'd MMM, yyyy',
                    initialValue: DateTime.now().toString(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    decoration: InputDecoration(border: InputBorder.none),
                    // icon: Icon(Icons.event),
                    dateLabelText: 'Date',
                    timeLabelText: "Hour",
                    selectableDayPredicate: (date) {
                      // Disable weekend days to select from the calendar
                      if (date.weekday == 6 || date.weekday == 7) {
                        return false;
                      }

                      return true;
                    },
                    onChanged: (val) => print(val),
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => print(val),
                  ),
                ),
                // Text(
                //     ' ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
              ],
            ),
          ),
        ),
      ],
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
                        Divider(
                          thickness: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Report())));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 11.sp),
                            child: Text('Report',
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontFamily: 'Gilroy',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff1A1A1A))),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Display())));

                            // Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 11.sp),
                            child: Text('Display',
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontFamily: 'Gilroy',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff1A1A1A))),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);

                            // Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 11.sp),
                            child: Text('Cancel',
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontFamily: 'Gilroy',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff1A1A1A))),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ])
                    ]))));
  }
}
