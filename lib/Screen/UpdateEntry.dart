import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../custom/CustomDropdown.dart';
import '../custom/custom.dart';

class UpdateEntry extends ConsumerStatefulWidget {
  const UpdateEntry({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateEntryState();
}

class _UpdateEntryState extends ConsumerState<UpdateEntry> {
  TextEditingController _textcontroller1 = TextEditingController();
  TextEditingController _textcontroller2 = TextEditingController();
  TextEditingController _textcontroller3 = TextEditingController();
   String _listName = "";
  String _listName1 = "";
   String _listName2 = "";
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Update Entry'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_sharp)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Customcolor().blacktheme,
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.more_vert_outlined,
          //     size: 25,
          //   ),
          //   color: Colors.white,
          //   onPressed: () {
          //     //   MainBottomsheet(context);
          //   },
          // ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            textField(_textcontroller1, "Head", ''  ),
            textField(_textcontroller2, "Sub Head", ''),
            textField(_textcontroller3, "Entry", ''),
            textField(_textcontroller3, "Keyword", ''),
            textField(_textcontroller3, "Sub Keyword", ''),
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
                   dropdown:  DropdownButton(
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
                      items:list.map<DropdownMenuItem<String>>((e) {
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
                  image: Image.asset('Assets/stripe.png',
                      width: 40, color: Color.fromARGB(255, 138, 88, 247)),
                  listed: list,
                  listname: 'P',
                ),
                CustomDropdown(
                  dropdown:  DropdownButton(
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
                      items:list.map<DropdownMenuItem<String>>((e) {
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
                  listed: list1,
                  listname: 'N',
                ),
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
                          offset: Offset(2, 2), // changes position of shadow
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
                          'Choose File',
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
            datepickerfrom(),
            CustomDropdown(
              dropdown:  DropdownButton(
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
                      items:list.map<DropdownMenuItem<String>>((e) {
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
                Icons.traffic,
                color: Color.fromARGB(255, 138, 88, 247),
              ),
              listed: list,
              listname: 'Frequancy',
            ),
             SizedBox(
                  height: 10,
                ),
            next('Save', () {
              //  Navigator.push(context,
              //             MaterialPageRoute(builder: ((context) {
              //           return ReportListed();
              //         })));
              print('object');
            },
                Customcolor().theam,
                // Color.fromARGB(255, 182, 12, 0),
                Colors.white),
                 SizedBox(
                  height: 80,
                ),
          ],
        ),
      ),
    );
  }

  Widget textField(
      TextEditingController controller, String placeholder, String field) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(left: 10, top: 15, right: 8.sp),
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
            child: TextField(
                keyboardType: TextInputType.text,
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: placeholder,
                  hintStyle: TextStyle(
                      color: Color(0xffABB4BD),
                      fontFamily: 'Gilroy',
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  contentPadding: EdgeInsets.only(left: 10, top: 18),
                ))),
      ],
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
}
