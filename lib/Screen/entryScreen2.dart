import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:conrev/Screen/reportscreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import '../custom/CustomDropdown.dart';
import '../custom/custom.dart';
import 'package:date_time_picker/date_time_picker.dart';

import '../helper/Entry_helper.dart';
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
  chooseAndUploadImage(
    context,
  ) async {
    var status = await Permission.storage.request();

    if (status.isDenied) {
      // We didn't ask for permission yet.
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text('Photo Permission'),
                content: Text('This app needs photo to upload user document'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('Deny'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    child: Text('Settings'),
                    onPressed: () => openAppSettings(),
                  ),
                ],
              ));
    } else if (status.isRestricted) {
      Fluttertoast.showToast(
        msg: "Go to your application settings and give photo permission ",
      );
    } else if (status.isGranted) {
      FilePickerResult filePickerResult;

      filePickerResult = (await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      ))!;

      // ignore: unnecessary_null_comparison
      if (filePickerResult == null) {
      } else {
        File _file = File("${filePickerResult.files.single.path}");
        ref.read(entryHelper).file =
            filePickerResult.paths.map((path) => File(path!)).toList();
        // dpprovider.profilebg=_file;

        print(_file);
      }
    }
  }

  String _listName = "P";
  String _listName1 = "D";
  String _listName2 = "M";
  List list = ['L', "F", "S", "P", "T", "C"];
  List list1 = ['N', "D", "A", 'T', "W", "F", 'M', "Q", "H", "Y"];
  List list2 = [
    'H',
    "M",
    "L",
  ];

  String? name1;

  @override
  Widget build(BuildContext context) {
    final helper = ref.read(entryHelper);
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
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Column(
                      children: [
                        textField(helper.Kw, "Enter new Kw", ''),
                        textField(helper.Swk, "Enter New SWK", ''),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            chooseAndUploadImage(
                              context,
                            );
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 10, top: 10, right: 8.sp),
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
                                  offset: Offset(
                                      2, 2), // changes position of shadow
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
                                          offset: Offset(2,
                                              2), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.file_upload_outlined,
                                        color:
                                            Color.fromARGB(255, 138, 88, 247),
                                      ),
                                      //  Icon(
                                      //   Icons.discount,
                                      //   color: Color.fromARGB(255, 138, 88, 247),
                                      // ),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Text(
                                  'File Upload',
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
                      dropdown: DropdownButton(
                          isExpanded: false,
                          menuMaxHeight: 300,
                          icon: Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //  crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${helper.Strip}"),

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
                              helper.Strip = value!;
                            });
                          }),
                      image: Image.asset('Assets/stripe.png',
                          width: 40, color: Color.fromARGB(255, 138, 88, 247)),
                      listed: list,
                      listname: 'P',
                    ),
                    CustomDropdown(
                      dropdown: DropdownButton(
                          isExpanded: false,
                          menuMaxHeight: 300,
                          icon: Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //  crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${helper.notif}"),

                              //  Padding(
                              //       padding: const EdgeInsets.only(right:18.0),
                              //    child: Icon(Icons.keyboard_arrow_down_sharp, color: Customcolor().blacktheme, size: 28),
                              //  ),
                            ],
                          ),
                          iconSize: 28,
                          elevation: 4,
                          underline: Container(),
                          items: list1.map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem<String>(
                                // enabled: true,
                                // alignment : AlignmentDirectional.bottomStart,
                                value: e,
                                child: Text(e.toString()));
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              helper.notif = value!;
                            });
                          }),
                      image: Icon(
                        Icons.notifications,
                        color: Color.fromARGB(255, 138, 88, 247),
                      ),
                      listed: list1,
                      listname: 'N',
                    ),
                    CustomDropdown(
                      dropdown: DropdownButton(
                          isExpanded: false,
                          menuMaxHeight: 300,
                          icon: Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //  crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${helper.freq}"),

                              //  Padding(
                              //       padding: const EdgeInsets.only(right:18.0),
                              //    child: Icon(Icons.keyboard_arrow_down_sharp, color: Customcolor().blacktheme, size: 28),
                              //  ),
                            ],
                          ),
                          iconSize: 28,
                          elevation: 4,
                          underline: Container(),
                          items: list2.map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem<String>(
                                // enabled: true,
                                // alignment : AlignmentDirectional.bottomStart,
                                value: e,
                                child: Text(e.toString()));
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              helper.freq = value!;
                            });
                          }),
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
                    InkWell(
                      onTap: () {
                        ref.read(entryHelper).getEntry(context);
                        // Navigator.push(context, MaterialPageRoute(builder: ((context) {
                        //   return EntryNextScreen();
                        // })));
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 60),
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
                    SizedBox(
                      height: 5.h,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget textField(
      TextEditingController controller, String placeholder, String field) {
    return Column(
      children: [
        Container(
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
            child: TextField(
                keyboardType: TextInputType.text,
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: placeholder,
                  hintStyle: TextStyle(
                      color: Color(0xffABB4BD),
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                  contentPadding: EdgeInsets.only(left: 10, top: 18),
                ))),
      ],
    );
  }

  Widget datepicker() {
    final helper = ref.read(entryHelper);
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
                    //  selectableDayPredicate: (date) {

                    //  }
                    onChanged: (val) {
                      helper.date = val;
                      print(val);
                    },
                    // selectableDayPredicate: (date) {
                    //   // Disable weekend days to select from the calendar
                    //   if (date.weekday == 6 || date.weekday == 7) {
                    //     return false;
                    //   }

                    //   return true;
                    // },
                    // onChanged: (val) => print(val),
                    // validator: (val) {
                    //   print(val);
                    //   return null;
                    // },
                    // onSaved: (val) => print(val),
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
