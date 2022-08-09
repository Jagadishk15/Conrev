import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../custom/custom.dart';
import 'entryScreen2.dart';

class EntryScreen extends ConsumerStatefulWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EntryScreenState();
}

class _EntryScreenState extends ConsumerState<EntryScreen> {
  TextEditingController _textcontroller1 = TextEditingController();
  TextEditingController _textcontroller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              'Entry',
              style: TextStyle(
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 18.sp,
                //color: Color.fromARGB(255, 255, 0, 98)
                //color: Color(0xffffffff)
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        textField(_textcontroller1, "Head", ''),
        textField(_textcontroller2, "Sub", ''),
        description(),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return EntryNextScreen(restorationId: 'main');
                          })));
            //  info.productname=_textcontroller1.text;
            //  info.description=_textcontroller2.text;
            
            // onPressed(function: onpressedtitle);
          },
          child: Container(
            //   margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            width: 95.w,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                color: Customcolor().blacktheme
               // color: Color(0xff591B4C)
                ),
            child: Center(
                child: Text(
              'Next',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Gilroy",
                  fontSize: 16),
            )),
          ),
        ),
        Container(),
      ],
    );
  }

  Widget description() {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 20, right: 8.sp),
      height: 35.h,
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
          controller: _textcontroller2,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: ' Description',
            hintStyle: TextStyle(
                color: Color(0xffABB4BD),
                fontFamily: 'Gilroy',
                fontSize: 18,
                fontWeight: FontWeight.w700),
            contentPadding: EdgeInsets.only(left: 10, top: 18),
            //  suffixIcon:  Image.asset("Assets/Images/searchright.png",
          )),
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
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  contentPadding: EdgeInsets.only(left: 10, top: 18),
                ))),
      ],
    );
  }
}
