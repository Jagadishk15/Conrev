import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../custom/CustomDropdown.dart';
import '../custom/custom.dart';
import '../helper/report_helper.dart';

class Report extends ConsumerStatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportState();
}

class _ReportState extends ConsumerState<Report> {
  String _listName = "";
  String _listName1 = "";
  String _listName2 = "";
  List list = ['l', 'm', 's'];
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
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Filter',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Gilroy",
                    fontSize: 14.sp,
                    // color: Color.fromARGB(255, 138, 88, 247)
                    //color: Color.fromARGB(255, 255, 0, 98)
                    //color: Color(0xffffffff)
                  ),
                ),
              ],
            ),
            CustomDropdown(
              dropdown: DropdownButton(
                  isExpanded: false,
                  menuMaxHeight: 300,
                  //alignment: AlignmentGeometry.,
                  // hint: Padding(
                  //   padding: const EdgeInsets.only(left:18.0),
                  //   child:  Text("$_currentSugars"),
                  // ),
                  // alignment : AlignmentDirectional.bottomStart,
                  icon: Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${_listName}"),

                      //  Padding(
                      //       padding: const EdgeInsets.only(right:18.0),
                      //    child: Icon(Icons.keyboard_arrow_down_sharp, color: Customcolor().blacktheme, size: 28),
                      //  ),
                    ],
                  ),
                  iconSize: 28,
                  elevation: 4,
                  underline: Container(),
                  items: list.map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem<String>(
                        // enabled: true,
                        // alignment : AlignmentDirectional.bottomStart,
                        value: e,
                        child: Text(e.toString()));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _listName = value!;
                    });
                  }),
              image: Icon(
                Icons.filter_alt,
                color: Color.fromARGB(255, 138, 88, 247),
              ),
              listed: list,
              listname: 'Select',
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Select',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Gilroy",
                    fontSize: 14.sp,
                    // color: Color.fromARGB(255, 138, 88, 247)
                    //color: Color.fromARGB(255, 255, 0, 98)
                    //color: Color(0xffffffff)
                  ),
                ),
              ],
            ),
            CustomDropdown(
              dropdown: DropdownButton(
                  isExpanded: false,
                  menuMaxHeight: 300,
                  //alignment: AlignmentGeometry.,
                  // hint: Padding(
                  //   padding: const EdgeInsets.only(left:18.0),
                  //   child:  Text("$_currentSugars"),
                  // ),
                  // alignment : AlignmentDirectional.bottomStart,
                  icon: Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${_listName}"),

                      //  Padding(
                      //       padding: const EdgeInsets.only(right:18.0),
                      //    child: Icon(Icons.keyboard_arrow_down_sharp, color: Customcolor().blacktheme, size: 28),
                      //  ),
                    ],
                  ),
                  iconSize: 28,
                  elevation: 4,
                  underline: Container(),
                  items: list.map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem<String>(
                        // enabled: true,
                        // alignment : AlignmentDirectional.bottomStart,
                        value: e,
                        child: Text(e.toString()));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _listName = value!;
                    });
                  }),
              image: Icon(
                Icons.notifications,
                color: Color.fromARGB(255, 138, 88, 247),
              ),
              listed: list,
              listname: 'Select',
            ),
            CustomDropdown(
              dropdown: DropdownButton(
                  isExpanded: false,
                  menuMaxHeight: 300,
                  //alignment: AlignmentGeometry.,
                  // hint: Padding(
                  //   padding: const EdgeInsets.only(left:18.0),
                  //   child:  Text("$_currentSugars"),
                  // ),
                  // alignment : AlignmentDirectional.bottomStart,
                  icon: Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${_listName}"),

                      //  Padding(
                      //       padding: const EdgeInsets.only(right:18.0),
                      //    child: Icon(Icons.keyboard_arrow_down_sharp, color: Customcolor().blacktheme, size: 28),
                      //  ),
                    ],
                  ),
                  iconSize: 28,
                  elevation: 4,
                  underline: Container(),
                  items: list.map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem<String>(
                        // enabled: true,
                        // alignment : AlignmentDirectional.bottomStart,
                        value: e,
                        child: Text(e.toString()));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _listName = value!;
                    });
                  }),
              image: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'KW',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Gilroy",
                        fontSize: 10.sp,
                        color: Color.fromARGB(255, 138, 88, 247)
                        //color: Color.fromARGB(255, 255, 0, 98)
                        //color: Color(0xffffffff)
                        ),
                  ),
                ],
              ),
              listed: list,
              listname: 'Select',
            ),
            CustomDropdown(
              dropdown: DropdownButton(
                  isExpanded: false,
                  menuMaxHeight: 300,
                  //alignment: AlignmentGeometry.,
                  // hint: Padding(
                  //   padding: const EdgeInsets.only(left:18.0),
                  //   child:  Text("$_currentSugars"),
                  // ),
                  // alignment : AlignmentDirectional.bottomStart,
                  icon: Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${_listName}"),

                      //  Padding(
                      //       padding: const EdgeInsets.only(right:18.0),
                      //    child: Icon(Icons.keyboard_arrow_down_sharp, color: Customcolor().blacktheme, size: 28),
                      //  ),
                    ],
                  ),
                  iconSize: 28,
                  elevation: 4,
                  underline: Container(),
                  items: list.map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem<String>(
                        // enabled: true,
                        // alignment : AlignmentDirectional.bottomStart,
                        value: e,
                        child: Text(e.toString()));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _listName = value!;
                    });
                  }),
              image: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SKW',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Gilroy",
                        fontSize: 10.sp,
                        color: Color.fromARGB(255, 138, 88, 247)
                        //color: Color.fromARGB(255, 255, 0, 98)
                        //color: Color(0xffffffff)
                        ),
                  ),
                ],
              ),
              listed: list,
              listname: 'Select',
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'From Date',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Gilroy",
                    fontSize: 14.sp,
                    // color: Color.fromARGB(255, 138, 88, 247)
                    //color: Color.fromARGB(255, 255, 0, 98)
                    //color: Color(0xffffffff)
                  ),
                ),
              ],
            ),
            datepickerfrom(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'To Date',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Gilroy",
                    fontSize: 14.sp,
                    // color: Color.fromARGB(255, 138, 88, 247)
                    //color: Color.fromARGB(255, 255, 0, 98)
                    //color: Color(0xffffffff)
                  ),
                ),
              ],
            ),
            datepickerto(),
            SizedBox(
              height: 20,
            ),
            next('Get Report', () {
              ref.read(reportHelper).getreport(context);
              //  Navigator.push(context,
              //             MaterialPageRoute(builder: ((context) {
              //           return ReportListed();
              //         })));
            },
                Customcolor().theam,
                // Color.fromARGB(255, 182, 12, 0),
                Colors.white),
            next('Clear', () {
              print('object');
            }, Colors.white, Customcolor().theam),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget next(String text, Function ontapped, Color colors, Color textcolor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: MaterialButton(
        onPressed: () {
          ontapped();
          //  Navigator.push(context,
          //                     MaterialPageRoute(builder: ((context) {
          //                   return MainScreen();
          //                 })));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Text(
            text,
            style: TextStyle(
              color: textcolor,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: .5,
            ),
          ),
        ),
        minWidth: 100.w,
        elevation: 5,
        color: colors,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        ),
      ),
    );
  }

  Widget datepickerfrom() {
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

  Widget datepickerto() {
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
}
