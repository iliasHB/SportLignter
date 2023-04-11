///Code written, organize & compiled by HABEEB SOLIU - software developer

import 'dart:async';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen(
      {Key? key})
      : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<FormState> otpCodeFormKey = GlobalKey<FormState>();
  //OtpController otpcontroller = OtpController();
  TextEditingController SignUocontroller = TextEditingController();

  TextEditingController otpController = TextEditingController();
  TextEditingController pinOne = TextEditingController();
  TextEditingController pinTwo = TextEditingController();
  TextEditingController pinThree = TextEditingController();
  TextEditingController pinFour = TextEditingController();
  String? _otp;
  bool isVerifyOtp = false;
  String currentText = "";
  bool hasError = false;
  late Timer _timer;
  int _start = 300;
  bool isLoading = false;
  //SignUpRespModel? feedback;
  bool isSignupPage = true;
  //OtpResModel? otp;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            //isLoading = false;
            //ProgressDialogUtils.hideProgressDialog();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              //width: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [

                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: (
                          16.00
                        ),
                        top: (
                          0.00
                        ),
                        right: (
                          16.00
                        ),
                        bottom: (
                          16.00
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Container(
                          //   width: size.width,
                          //   child: Padding(
                          //     padding: EdgeInsets.only(
                          //       right: getHorizontalSize(
                          //         110.00,
                          //       ),
                          //     ),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       crossAxisAlignment: CrossAxisAlignment.center,
                          //       mainAxisSize: MainAxisSize.max,
                          //       children: [
                          //         Padding(
                          //           padding: EdgeInsets.only(
                          //               top: getVerticalSize(0)),
                          //           child: IconButton(
                          //             onPressed: () {
                          //               handlePageRoute();
                          //             },
                          //             constraints: BoxConstraints(
                          //               minHeight: getSize(
                          //                 40.00,
                          //               ),
                          //               minWidth: getSize(
                          //                 40.00,
                          //               ),
                          //             ),
                          //             padding: EdgeInsets.only(
                          //                 top: getVerticalSize(0)),
                          //             icon: Container(
                          //                 width: getSize(
                          //                   40.00,
                          //                 ),
                          //                 height: getSize(
                          //                   40.00,
                          //                 ),
                          //                 decoration: BoxDecoration(
                          //                   borderRadius: BorderRadius.circular(
                          //                     getHorizontalSize(
                          //                       12.00,
                          //                     ),
                          //                   ),
                          //                   border: Border.all(
                          //                     color: ColorConstant.whiteA70063,
                          //                     width: getHorizontalSize(
                          //                       2.00,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 child: Icon(
                          //                   Icons.arrow_back_ios_rounded,
                          //                   color: ColorConstant.whiteA700,
                          //                 )
                          //               // Image.asset(
                          //               //   ImageConstant.imgBack,
                          //               // ),
                          //             ),
                          //           ),
                          //         ),
                          //         Padding(
                          //           padding: EdgeInsets.only(
                          //             left: getHorizontalSize(
                          //               70.00,
                          //             ),
                          //             top: getVerticalSize(
                          //               0.00,
                          //             ),
                          //             bottom: getVerticalSize(
                          //               6.00,
                          //             ),
                          //           ),
                          //           child: Text(
                          //             constant.lbl_verify_email,
                          //             overflow: TextOverflow.ellipsis,
                          //             textAlign: TextAlign.center,
                          //             style: AppStyle.textstyledmsansbold20
                          //                 .copyWith(
                          //               fontSize: getFontSize(
                          //                 20,
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Expanded(
                          //       flex: 4,
                          //       child: Container(
                          //         margin: EdgeInsets.only(
                          //           top: getVerticalSize(
                          //             20.00,
                          //           ),
                          //         ),
                          //         child: RichText(
                          //           text: TextSpan(
                          //             children: [
                          //               TextSpan(
                          //                 text: constant.msg_enter_the_code2 +
                          //                     "\n",
                          //                 style: TextStyle(
                          //                   color: ColorConstant.gray100,
                          //                   fontSize: getFontSize(
                          //                     18,
                          //                   ),
                          //                   fontFamily: 'DM Sans',
                          //                   fontWeight: FontWeight.w400,
                          //                 ),
                          //               ),
                          //               TextSpan(
                          //                 text: widget.email == ''
                          //                     ? null
                          //                     : "( " +
                          //                     widget.email.toString() +
                          //                     " )",
                          //                 style: TextStyle(
                          //                   color: ColorConstant.orange300,
                          //                   fontSize: getFontSize(
                          //                     18,
                          //                   ),
                          //                   fontFamily: 'DM Sans',
                          //                   fontWeight: FontWeight.w400,
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //           textAlign: TextAlign.center,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Form(
                              key: otpCodeFormKey,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  OtpInput(pinOne),
                                  OtpInput(pinTwo),
                                  OtpInput(pinThree),
                                  OtpInput(pinFour),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //Padding(
          //padding: EdgeInsets.only(top: getVerticalSize(10)),
          _start != 0
              ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
               'Verify Otp code :',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(width: 10),
              Text(
                _start.toString(),
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          )
              : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Did not received otp',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: (16
                        ),
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: ' ',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,

                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                onTap: () {
                  print('OTP recent');
                  _start = 300;
                  //isLoading = true;
                  //handleResendOtp();
                  startTimer();
                },
                child: Text(
                  'Resend code',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: (
                      16
                    ),
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          //),
          Padding(
            padding: EdgeInsets.only(
              left: (
                10.00
              ),
              top: (
                39.00
              ),
              right: (
                10.00
              ),
              bottom: (
                20.00
              ),
            ),
            child:
            //   isLoading
            //       ? const CircularProgressIndicator.adaptive(
            //           strokeWidth: 4,
            //           valueColor: AlwaysStoppedAnimation<Color>(
            //             Colors.teal,
            //           ),
            //         )
            //       : Container()
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _otp = pinOne.text +
                        pinTwo.text +
                        pinThree.text +
                        pinFour.text;
                  });
                  print(_otp);
                  //handleOTPVerification(_otp!);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: (
                    54.00
                  ),
                  //width: size.width,
                  //decoration: AppDecoration.textstyledmsansmedium16,
                  child: Text(
                    'Continue',
                    textAlign: TextAlign.center,
                    //style: AppStyle.textstyledmsansmedium16.copyWith(
                      //fontSize: 18

                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
    // final now = DateTime.now();
    // final currentTimeformat = DateFormat("HH:mm:ss").format(now);
  }


  ///This is the Function of the Otp text input which was imported/added to the otp page above
  OtpInput(TextEditingController controller) {
    //final GlobalKey<FormState> otpCodeFormKey = GlobalKey<FormState>();
    return Container(
      width: 50,
      child: TextFormField(
        //autofocus: autoFocus,
          textAlign: TextAlign.center,
          cursorHeight: 30,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.white, fontSize: 30.0),
          controller: controller,
          maxLength: 1,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.teal, width: 2.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
              ),
              counterText: '',
              hintStyle: TextStyle(color: Colors.white, fontSize: 30.0)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Empty";
            }
            return null;
          },
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty) {
              FocusScope.of(context).previousFocus();
            }
          }),
    );
  }
}