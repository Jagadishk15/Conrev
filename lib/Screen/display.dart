import 'package:conrev/widgets/display/display_tile.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../custom/custom.dart';
import '../helper/display_helper.dart';
import 'UpdateEntry.dart';

class Display extends ConsumerStatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DisplayState();
}

class _DisplayState extends ConsumerState<Display> {
  @override
  void initState() {
    Future.microtask(() => ref.read(displaytHelper).getdisplay(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(displaytHelper).model;

    return Scaffold(
      appBar: AppBar(
        title: Text('Display'),
        backgroundColor: Customcolor().blacktheme,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert_outlined,
              size: 25,
            ),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : ListView(
              padding: EdgeInsets.all(15),
              children: [
                DisplayTile(
                  strip: "L",
                  count: data.l?.length,
                  list: data.l ?? [],
                ),
                SizedBox(height: 20),
                DisplayTile(
                  strip: "F",
                  count: data.f?.length,
                  list: data.f ?? [],
                ),
                SizedBox(height: 20),
                DisplayTile(
                  strip: "S",
                  count: data.s?.length,
                  list: data.s ?? [],
                ),
                SizedBox(height: 20),
                DisplayTile(
                  strip: "P",
                  count: data.p?.length,
                  list: data.p ?? [],
                ),
                SizedBox(height: 20),
                DisplayTile(
                  strip: "T",
                  count: data.t?.length,
                  list: data.t ?? [],
                ),
                SizedBox(height: 20),
                DisplayTile(
                  strip: "C",
                  count: data.c?.length,
                  list: data.c ?? [],
                ),
              ],
            ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Display'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
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
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              // scrollDirection: Axis.vertical,
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return ExpandableNotifier(
                  // <-- Provides ExpandableController to its children
                  child: Column(
                    children: [
                      ExpandableNotifier(
                        child: Container(
                          margin: EdgeInsets.all(10),
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
                          //clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: <Widget>[
                              // SizedBox(
                              //   height: 150,
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       color: Colors.orange,
                              //       shape: BoxShape.rectangle,
                              //     ),
                              //   ),
                              // ),
                              ScrollOnExpand(
                                scrollOnExpand: true,
                                scrollOnCollapse: false,
                                child: ExpandablePanel(
                                  theme: const ExpandableThemeData(
                                    hasIcon: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    tapBodyToCollapse: true,
                                  ),
                                  header: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              color: Colors.grey[700],
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
                                            child: Center(
                                              child: Text(
                                                "E",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              color: Colors.white,
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
                                            child: Center(
                                              child: Text(
                                                "1",
                                                //style: Theme.of(context).textTheme.body2,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                  collapsed: Container(),
                                  expanded: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 30,
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: Colors.yellow[900],
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
                                            child: Center(
                                                child: Text(
                                              'Medium',
                                              style: TextStyle(
                                                  letterSpacing: .5,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Gilroy",
                                                  fontSize: 13,
                                                  color: Colors.white
                                                  //color: Color.fromARGB(255, 255, 0, 98)
                                                  //color: Color(0xffffffff)
                                                  ),
                                            )),
                                          ),
                                          PopupMenuButton(
                                              // add icon, by default "3 dot" icon
                                              // icon: Icon(Icons.book)
                                              itemBuilder: (context) {
                                            return [
                                              PopupMenuItem<int>(
                                                value: 1,
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.check,
                                                        color: Color.fromARGB(
                                                            255, 138, 88, 247)),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Save",
                                                      style: TextStyle(
                                                          letterSpacing: .5,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: ((context) {
                                                return UpdateEntry();
                                              })));
                                              print(
                                                  "My account menu is selected.");
                                            } else if (value == 1) {
                                              print(
                                                  "Settings menu is selected.");
                                            } else if (value == 2) {
                                              print("Logout menu is selected.");
                                            }
                                          }),
                                        ],
                                      ),
                                      description(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                                width: 70,
                                                margin: EdgeInsets.all(20),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  color:
                                                      Customcolor().blacktheme,
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
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'Save',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                //       ListView.builder(

                                                //   shrinkWrap: true,
                                                //   itemCount: 5,
                                                //   itemBuilder: (context,index){
                                                //   return Container(
                                                //     height: 10,
                                                //     width: 10,
                                                //     color: Colors.red,
                                                //                                                   );
                                                //  }),
                                                for (var _
                                                    in Iterable.generate(5))
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text('20-11-2022'),
                                                  ),
                                                //Text('data')
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                for (var _
                                                    in Iterable.generate(5))
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text('2'),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                for (var _
                                                    in Iterable.generate(5))
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child:
                                                        Text('Jagadishsssssss'),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                // for (var _ in Iterable.generate(5))
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                      margin: EdgeInsets.all(6),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9),
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black12,
                                                            spreadRadius: 1,
                                                            blurRadius: 5,
                                                            offset: Offset(2,
                                                                2), // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            Icon(Icons.remove),
                                                      )),
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                      margin: EdgeInsets.all(6),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9),
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black12,
                                                            spreadRadius: 1,
                                                            blurRadius: 5,
                                                            offset: Offset(2,
                                                                2), // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Icon(Icons
                                                            .remove_circle),
                                                      )),
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                      margin: EdgeInsets.all(6),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9),
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black12,
                                                            spreadRadius: 1,
                                                            blurRadius: 5,
                                                            offset: Offset(2,
                                                                2), // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Icon(Icons.add),
                                                      )),
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                      margin: EdgeInsets.all(6),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9),
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black12,
                                                            spreadRadius: 1,
                                                            blurRadius: 5,
                                                            offset: Offset(2,
                                                                2), // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            Icon(Icons.add_box),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  builder: (_, collapsed, expanded) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10, bottom: 10),
                                      child: Expandable(
                                        collapsed: collapsed,
                                        expanded: expanded,
                                        theme: const ExpandableThemeData(
                                            crossFadePoint: 0),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
    );
  }

  Widget description() {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, right: 8.sp, bottom: 10),
      height: 15.h,
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
          keyboardType: TextInputType.multiline,
          maxLines: 10,
          style: TextStyle(
              //color: Color(0xffABB4BD),
              fontFamily: 'Gilroy',
              fontSize: 14,
              letterSpacing: .5,
              fontWeight: FontWeight.w400),
          // controller: _textcontroller2,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: ' Description',
            hintStyle: TextStyle(
                color: Color(0xffABB4BD),
                fontFamily: 'Gilroy',
                fontSize: 14,
                fontWeight: FontWeight.w700),
            contentPadding: EdgeInsets.only(left: 10, top: 18),
            //  suffixIcon:  Image.asset("Assets/Images/searchright.png",
          )),
    );
  }
}




// return Scaffold(
//       appBar: AppBar(
//         title: Text('Display'),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back_ios_new_sharp),
//         ),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         backgroundColor: Customcolor().blacktheme,
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.more_vert_outlined,
//               size: 25,
//             ),
//             color: Colors.white,
//             onPressed: () {
//               //   MainBottomsheet(context);
//             },
//           ),
//         ],
//       ),
//       body: data == null
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               physics: BouncingScrollPhysics(),
//               // scrollDirection: Axis.vertical,
//               itemCount: 5,
//               shrinkWrap: true,
//               itemBuilder: ((context, index) {
//                 return ExpandableNotifier(
//                   // <-- Provides ExpandableController to its children
//                   child: Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(9),
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black12,
//                               spreadRadius: 1,
//                               blurRadius: 5,
//                               offset: Offset(2, 2),
//                             ),
//                           ],
//                         ),
//                         child: ExpansionTile(
//                           title: SizedBox.shrink(),
//                           leading: Container(
//                             width: 40,
//                             height: 40,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.grey[700],
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black12,
//                                   spreadRadius: 1,
//                                   blurRadius: 5,
//                                   offset: Offset(2, 2),
//                                 ),
//                               ],
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "E",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                           children: [
//                             Text("Hellop"),
//                           ],
//                         ),
//                       ),
//                       ExpandableNotifier(
//                         child: Container(
//                           margin: EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(9),
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black12,
//                                 spreadRadius: 1,
//                                 blurRadius: 5,
//                                 offset:
//                                     Offset(2, 2), // changes position of shadow
//                               ),
//                             ],
//                           ),
//                           //clipBehavior: Clip.antiAlias,
//                           child: Column(
//                             children: <Widget>[
//                               // SizedBox(
//                               //   height: 150,
//                               //   child: Container(
//                               //     decoration: BoxDecoration(
//                               //       color: Colors.orange,
//                               //       shape: BoxShape.rectangle,
//                               //     ),
//                               //   ),
//                               // ),
//                               ScrollOnExpand(
//                                 scrollOnExpand: true,
//                                 scrollOnCollapse: false,
//                                 child: ExpandablePanel(
//                                   theme: const ExpandableThemeData(
//                                     hasIcon: false,
//                                     headerAlignment:
//                                         ExpandablePanelHeaderAlignment.center,
//                                     tapBodyToCollapse: true,
//                                   ),
//                                   header: Padding(
//                                       padding: EdgeInsets.all(10),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Container(
//                                             width: 40,
//                                             height: 40,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(9),
//                                               color: Colors.grey[700],
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Colors.black12,
//                                                   spreadRadius: 1,
//                                                   blurRadius: 5,
//                                                   offset: Offset(2,
//                                                       2), // changes position of shadow
//                                                 ),
//                                               ],
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                 "E",
//                                                 style: TextStyle(
//                                                     color: Colors.white),
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             width: 40,
//                                             height: 40,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(9),
//                                               color: Colors.white,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Colors.black12,
//                                                   spreadRadius: 1,
//                                                   blurRadius: 5,
//                                                   offset: Offset(2,
//                                                       2), // changes position of shadow
//                                                 ),
//                                               ],
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                 "1",
//                                                 //style: Theme.of(context).textTheme.body2,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       )),
//                                   collapsed: Container(),
//                                   expanded: Column(
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Container(
//                                             width: 80,
//                                             height: 30,
//                                             margin: EdgeInsets.all(10),
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(4),
//                                               color: Colors.yellow[900],
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Colors.black12,
//                                                   spreadRadius: 1,
//                                                   blurRadius: 5,
//                                                   offset: Offset(2,
//                                                       2), // changes position of shadow
//                                                 ),
//                                               ],
//                                             ),
//                                             child: Center(
//                                                 child: Text(
//                                               'Medium',
//                                               style: TextStyle(
//                                                   letterSpacing: .5,
//                                                   fontWeight: FontWeight.w600,
//                                                   fontFamily: "Gilroy",
//                                                   fontSize: 13,
//                                                   color: Colors.white
//                                                   //color: Color.fromARGB(255, 255, 0, 98)
//                                                   //color: Color(0xffffffff)
//                                                   ),
//                                             )),
//                                           ),
//                                           PopupMenuButton(
//                                               // add icon, by default "3 dot" icon
//                                               // icon: Icon(Icons.book)
//                                               itemBuilder: (context) {
//                                             return [
//                                               PopupMenuItem<int>(
//                                                 value: 1,
//                                                 child: Row(
//                                                   children: [
//                                                     Icon(Icons.check,
//                                                         color: Color.fromARGB(
//                                                             255, 138, 88, 247)),
//                                                     SizedBox(
//                                                       width: 10,
//                                                     ),
//                                                     Text(
//                                                       "Save",
//                                                       style: TextStyle(
//                                                           letterSpacing: .5,
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                           fontFamily: "Gilroy",
//                                                           fontSize: 13.sp,
//                                                           color: Color.fromARGB(
//                                                               255, 138, 88, 247)
//                                                           //color: Color.fromARGB(255, 255, 0, 98)
//                                                           //color: Color(0xffffffff)
//                                                           ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               PopupMenuItem<int>(
//                                                 value: 0,
//                                                 child: Row(
//                                                   children: [
//                                                     Icon(Icons.edit,
//                                                         color: Color.fromARGB(
//                                                             255, 138, 88, 247)),
//                                                     SizedBox(
//                                                       width: 10,
//                                                     ),
//                                                     Text(
//                                                       "Edit",
//                                                       style: TextStyle(
//                                                           letterSpacing: .5,
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                           fontFamily: "Gilroy",
//                                                           fontSize: 13.sp,
//                                                           color: Color.fromARGB(
//                                                               255, 138, 88, 247)
//                                                           //color: Color.fromARGB(255, 255, 0, 98)
//                                                           //color: Color(0xffffffff)
//                                                           ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               PopupMenuItem<int>(
//                                                 value: 1,
//                                                 child: Row(
//                                                   children: [
//                                                     Icon(Icons.delete,
//                                                         color: Color.fromARGB(
//                                                             255, 138, 88, 247)),
//                                                     SizedBox(
//                                                       width: 10,
//                                                     ),
//                                                     Text(
//                                                       "Delete",
//                                                       style: TextStyle(
//                                                           letterSpacing: .5,
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                           fontFamily: "Gilroy",
//                                                           fontSize: 13.sp,
//                                                           color: Color.fromARGB(
//                                                               255, 138, 88, 247)
//                                                           //color: Color.fromARGB(255, 255, 0, 98)
//                                                           //color: Color(0xffffffff)
//                                                           ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ];
//                                           }, onSelected: (value) {
//                                             if (value == 0) {
//                                               Navigator.push(context,
//                                                   MaterialPageRoute(
//                                                       builder: ((context) {
//                                                 return UpdateEntry();
//                                               })));
//                                               print(
//                                                   "My account menu is selected.");
//                                             } else if (value == 1) {
//                                               print(
//                                                   "Settings menu is selected.");
//                                             } else if (value == 2) {
//                                               print("Logout menu is selected.");
//                                             }
//                                           }),
//                                         ],
//                                       ),
//                                       description(),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: [
//                                           InkWell(
//                                             onTap: () {},
//                                             child: Container(
//                                                 width: 70,
//                                                 margin: EdgeInsets.all(20),
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(9),
//                                                   color:
//                                                       Customcolor().blacktheme,
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                       color: Colors.black12,
//                                                       spreadRadius: 1,
//                                                       blurRadius: 5,
//                                                       offset: Offset(2,
//                                                           2), // changes position of shadow
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 child: Center(
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             8.0),
//                                                     child: Text(
//                                                       'Save',
//                                                       style: TextStyle(
//                                                           color: Colors.white),
//                                                     ),
//                                                   ),
//                                                 )),
//                                           ),
//                                         ],
//                                       ),
//                                       Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Expanded(
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 //       ListView.builder(

//                                                 //   shrinkWrap: true,
//                                                 //   itemCount: 5,
//                                                 //   itemBuilder: (context,index){
//                                                 //   return Container(
//                                                 //     height: 10,
//                                                 //     width: 10,
//                                                 //     color: Colors.red,
//                                                 //                                                   );
//                                                 //  }),
//                                                 for (var _
//                                                     in Iterable.generate(5))
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             4.0),
//                                                     child: Text('20-11-2022'),
//                                                   ),
//                                                 //Text('data')
//                                               ],
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Column(
//                                               children: [
//                                                 for (var _
//                                                     in Iterable.generate(5))
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             4.0),
//                                                     child: Text('2'),
//                                                   ),
//                                               ],
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Column(
//                                               children: [
//                                                 for (var _
//                                                     in Iterable.generate(5))
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             4.0),
//                                                     child:
//                                                         Text('Jagadishsssssss'),
//                                                   ),
//                                               ],
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Column(
//                                               children: [
//                                                 // for (var _ in Iterable.generate(5))
//                                                 InkWell(
//                                                   onTap: () {},
//                                                   child: Container(
//                                                       margin: EdgeInsets.all(6),
//                                                       decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(9),
//                                                         color: Colors.white,
//                                                         boxShadow: [
//                                                           BoxShadow(
//                                                             color:
//                                                                 Colors.black12,
//                                                             spreadRadius: 1,
//                                                             blurRadius: 5,
//                                                             offset: Offset(2,
//                                                                 2), // changes position of shadow
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(8.0),
//                                                         child:
//                                                             Icon(Icons.remove),
//                                                       )),
//                                                 ),
//                                                 InkWell(
//                                                   onTap: () {},
//                                                   child: Container(
//                                                       margin: EdgeInsets.all(6),
//                                                       decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(9),
//                                                         color: Colors.white,
//                                                         boxShadow: [
//                                                           BoxShadow(
//                                                             color:
//                                                                 Colors.black12,
//                                                             spreadRadius: 1,
//                                                             blurRadius: 5,
//                                                             offset: Offset(2,
//                                                                 2), // changes position of shadow
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(8.0),
//                                                         child: Icon(Icons
//                                                             .remove_circle),
//                                                       )),
//                                                 ),
//                                                 InkWell(
//                                                   onTap: () {},
//                                                   child: Container(
//                                                       margin: EdgeInsets.all(6),
//                                                       decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(9),
//                                                         color: Colors.white,
//                                                         boxShadow: [
//                                                           BoxShadow(
//                                                             color:
//                                                                 Colors.black12,
//                                                             spreadRadius: 1,
//                                                             blurRadius: 5,
//                                                             offset: Offset(2,
//                                                                 2), // changes position of shadow
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(8.0),
//                                                         child: Icon(Icons.add),
//                                                       )),
//                                                 ),
//                                                 InkWell(
//                                                   onTap: () {},
//                                                   child: Container(
//                                                       margin: EdgeInsets.all(6),
//                                                       decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(9),
//                                                         color: Colors.white,
//                                                         boxShadow: [
//                                                           BoxShadow(
//                                                             color:
//                                                                 Colors.black12,
//                                                             spreadRadius: 1,
//                                                             blurRadius: 5,
//                                                             offset: Offset(2,
//                                                                 2), // changes position of shadow
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(8.0),
//                                                         child:
//                                                             Icon(Icons.add_box),
//                                                       )),
//                                                 ),
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                   builder: (_, collapsed, expanded) {
//                                     return Padding(
//                                       padding: EdgeInsets.only(
//                                           left: 10, right: 10, bottom: 10),
//                                       child: Expandable(
//                                         collapsed: collapsed,
//                                         expanded: expanded,
//                                         theme: const ExpandableThemeData(
//                                             crossFadePoint: 0),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//               }),
//             ),
//     );
//   }

//   Widget description() {
//     return Container(
//       margin: EdgeInsets.only(left: 10, top: 10, right: 8.sp, bottom: 10),
//       height: 15.h,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(9),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: Offset(2, 2), // changes position of shadow
//           ),
//         ],
//       ),
//       child: TextField(
//           keyboardType: TextInputType.multiline,
//           maxLines: 10,
//           style: TextStyle(
//               //color: Color(0xffABB4BD),
//               fontFamily: 'Gilroy',
//               fontSize: 14,
//               letterSpacing: .5,
//               fontWeight: FontWeight.w400),
//           // controller: _textcontroller2,
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: ' Description',
//             hintStyle: TextStyle(
//                 color: Color(0xffABB4BD),
//                 fontFamily: 'Gilroy',
//                 fontSize: 14,
//                 fontWeight: FontWeight.w700),
//             contentPadding: EdgeInsets.only(left: 10, top: 18),
//             //  suffixIcon:  Image.asset("Assets/Images/searchright.png",
//           )),
//     );