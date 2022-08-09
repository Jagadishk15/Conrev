import 'package:conrev/Screen/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../constant/CustomLottie.dart';
import '../constant/CustomStyle.dart';
import '../custom/custom.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController _textcontroller1 = TextEditingController();
  TextEditingController _textcontroller2 = TextEditingController();
  bool _isHidden = true;
      void _togglePasswordView() {
    setState(() {
        _isHidden = !_isHidden;
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor().theam,
        //  appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.h,),
              Text(
                'Conrev',
                style: CustomFont().Logofontstyle,
              ),
              SizedBox(
                height: 15,
              ),
             LottiesImage(). login,
              textField(
                false,
                _textcontroller1,
                'Username',
              ),
              textField(
                true,
                _textcontroller2,
                'Password',
              ),
               SizedBox(
            height: 40,
          ),
              next(),
                SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }

  Widget textField(
    bool secure,
    TextEditingController controller, String placeholder) {
    return Column(
      
   //   mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(height: 30,),

        SizedBox(
          height: 10,
        ),
        Container(
            margin: EdgeInsets.only(left: 10, top: 10, right: 8.sp),
            // width: 51.w,
            height: 15.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(2, 2), // changes position of shadow
                ),
              ],
            ),
            child: TextField(
                keyboardType: TextInputType.text,
                controller: controller,
                obscureText:secure==true? _isHidden:false,
                decoration: InputDecoration(
                  suffix:secure==true? InkWell(
                  onTap: _togglePasswordView,  /// This is Magical Function
                  child: Icon(
                    _isHidden ?         /// CHeck Show & Hide.
                     Icons.visibility :
                     Icons.visibility_off,
                  ),
                ):null,
                  border: InputBorder.none,
                  hintText: placeholder,
                  hintStyle: TextStyle(
                      color: Color(0xffABB4BD),
                      fontFamily: 'Gilroy',
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                  contentPadding: EdgeInsets.only(
                    right: 20,
                    left: 20, top:secure==true? 10:19, bottom: 7),
                ))),
      ],
    );
  }

  Widget next() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: MaterialButton(
        onPressed: () {
           Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return MainScreen();
                          })));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Text(
            'SignIn',
            style: TextStyle(
              color:Customcolor().theam,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: .5,
            ),
          ),
        ),
        minWidth: 100.w,
        elevation: 5,
       color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        ),
      ),
    );
  }
}
// class LoginScreen extends ConsumerStatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends ConsumerState<LoginScreen> {
//   late FocusNode myFocusNode;
//   bool focus = true;
//   @override
//   void initState() {
//     super.initState();

//     myFocusNode = FocusNode();
//   }

//   @override
//   void dispose() {
//     // Clean up the focus node when the Form is disposed.
//     myFocusNode.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   backgroundColor: Colors.white,
//       //   elevation: 0,
//       //   title: Text(
//       //     'Conrev',
//       //     style: TextStyle(
//       //       letterSpacing: 1,
//       //       fontWeight: FontWeight.w600,
//       //       fontFamily: "Gilroy",
//       //       fontSize: 18.sp,
//       //       color: Colors.black
//       //     ),
//       //   ),
//       // ),
//        backgroundColor: Colors.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 30),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     spreadRadius: 1,
//                     blurRadius: 5,
//                     offset: Offset(2, 2), // changes position of shadow
//                   ),
//                 ],
//               ),
//               height: 300,
//               width: double.infinity,
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(10),
//                               topLeft: Radius.circular(10),
//                             ),
//                             color: Colors.grey[300],
//                           ),
//                           height: 60,
//                           width: double.infinity,
//                           child: Center(
//                               child: Container(
//                             child: Text(
//                               'User Login admin',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 13.sp,
//                                   fontFamily: 'Gilroy'),
//                             ),
//                           )),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             // width: 51.w,
//                             height: 10.w,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(9),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey,
//                                   //  color: myFocusNode==true?Colors.green:Colors.red,
//                                   spreadRadius: .5,
//                                   blurRadius: .5,
//                                   offset: Offset(
//                                       0, 0), // changes position of shadow
//                                 ),
//                               ],
//                             ),
//                             child: TextField(
//                                 autofocus: true,
//                                 // controller: _controller,
//                                 // keyboardType: type,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   hintText: 'Enter username',
//                                   hintStyle: TextStyle(
//                                       color: Color(0xffABB4BD),
//                                       fontFamily: 'Gilroy',
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w700),
//                                   contentPadding: EdgeInsets.only(
//                                       left: 10, top: 0, bottom: 6),
//                                 ))),
//                         Container(
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             // width: 51.w,
//                             height: 10.w,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(9),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey,
//                                   //  color: myFocusNode==true?Colors.green:Colors.red,
//                                   spreadRadius: .5,
//                                   blurRadius: .5,
//                                   offset: Offset(
//                                       0, 0), // changes position of shadow
//                                 ),
//                               ],
//                             ),
//                             child: TextField(
//                                 focusNode: myFocusNode,
//                                 // autofocus: true,
//                                 // controller: _controller,
//                                 // keyboardType: type,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   hintText: 'Enter password',
//                                   hintStyle: TextStyle(
//                                       color: Color(0xffABB4BD),
//                                       fontFamily: 'Gilroy',
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w700),
//                                   contentPadding: EdgeInsets.only(
//                                       left: 10, top: 0, bottom: 6),
//                                 ))),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     // height: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.only(
//                         bottomRight: Radius.circular(10),
//                         bottomLeft: Radius.circular(10),
//                       ),
//                     ),
//                     width: double.infinity,
//                     child: Center(
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: ((context) {
//                             return MainScreen();
//                           })));
//                         },
//                         child: Container(
//                           margin: EdgeInsets.symmetric(vertical: 10),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black12,
//                                   spreadRadius: 1,
//                                   blurRadius: 5,
//                                   offset: Offset(
//                                       2, 2), // changes position of shadow
//                                 ),
//                               ],
//                               color: Customcolor().themecolor),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 12.0, horizontal: 20),
//                             child: Text(
//                               'Submit',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 10.sp,
//                                   fontFamily: 'Gilroy'),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
