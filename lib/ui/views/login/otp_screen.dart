// Import required Dart packages
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../business_logic/cubits/login_cubit/login_cubit.dart';
import '../../../data/repositories/JWT/jwt_token.dart';
import '../../../utils/app_utils.dart';

// OtpScreen Widget
class OtpScreen extends StatefulWidget {
  final phoneNumber;
  const OtpScreen({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // Variables for OTP countdown
  int countdown = 60;
  bool canResend = false;

  // Function to start the countdown timer for OTP resend
  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (countdown == 0) {
        setState(() {
          timer.cancel();
          canResend = true;
        });
      } else {
        setState(() {
          countdown--;
        });
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            // Show a snackbar when OTP is verified successfully
            if (state is OtpVerified) {
              saveJwtToSharedPreferences(state.token ?? "");

            }
            // Show a snackbar when there is an error with OTP verification
            else if (state is OtpError) {
              Get.showSnackbar(SnackBar_error(state, context));
            }
            // Show a snackbar when OTP is sent successfully
            if (state is OtpSent) {
              setState(() {
                startTimer();
                countdown = 60;
                canResend = false;
              });
              Get.showSnackbar(snackbar_success(state, context));
            }
            // Show a snackbar when there is an error with OTP sending
            else if (state is OtpError) {
              Get.showSnackbar(SnackBar_error(state, context));
            }
          },
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.loginIcon,),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppImages.logo),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Verify OTP",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  // OTP TextField for entering the OTP code
                                  OtpTextField(
                                    handleControllers: (value) {
                                      for (var element in value) {
                                        element?.addListener(() {
                                          if (element.text.isNotEmpty) {
                                            setState(() {
                                              print(element.text);
                                            });
                                          }
                                        });
                                      }
                                    },
                                    borderWidth: 1,
                                    borderRadius: BorderRadius.circular(2),
                                    fieldWidth: 50,
                                    margin: EdgeInsets.only(right: 5),
                                    textStyle: textTheme.displaySmall
                                        ?.copyWith(color: AppColor.black),
                                    numberOfFields: 6,
                                    enabledBorderColor: AppColor.white,
                                    focusedBorderColor: AppColor.white,
                                    // Set to true to show OTP fields as boxes or false to show as dashes
                                    showFieldAsBox: true,
                                    // Callback when a code is typed in
                                    onCodeChanged: (String code) {
                                      // Handle validation or checks here
                                    },
                                    // Callback when all text fields are filled
                                    onSubmit: (String verificationCode) async {
                                      Navigator.of(context).pushNamed("/homepage");
                                      // Verify OTP when all fields are filled
                                      BlocProvider.of<LoginCubit>(context).verifyOtp(
                                          widget.phoneNumber, verificationCode);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // Display "Resend OTP" or the countdown timer based on the canResend variable
                                  canResend
                                      ? Row(
                                    children: [
                                      const Text("Didn't receive the code?",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.black)),
                                      InkWell(
                                        onTap: () {
                                          if (canResend) {
                                            BlocProvider.of<LoginCubit>(context)
                                                .sendOtp(widget.phoneNumber);
                                            startTimer();
                                          }
                                        },
                                        child: const Text("Resend OTP",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.ctaButtoncolor)),
                                      ),
                                    ],
                                  )
                                      : Row(
                                    children: [
                                      const Text("Resend OTP ",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.ctaRedcolor)),
                                      Text("in ${countdown.toString()} sec",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: AppColor.borderColor))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Function to create a snackbar for displaying OTP error
  GetSnackBar SnackBar_error(OtpError state, context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GetSnackBar(
      borderRadius: 10,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      leftBarIndicatorColor: AppColor.ctaRedcolor,
      backgroundColor: Colors.white,
      titleText: Text(
        "Error",
        style: textTheme.bodyLarge,
      ),
      messageText: Text(
        state.error,
        style: textTheme.bodySmall?.copyWith(color: AppColor.subHeading),
      ),
      icon: const Icon(Icons.close, color: AppColor.snackBarGreen),
      duration: const Duration(seconds: 3),
    );
  }

  // Function to create a snackbar for displaying OTP sent success
  GetSnackBar snackbar_success(OtpSent state, context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GetSnackBar(
      borderRadius: 10,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      leftBarIndicatorColor: AppColor.snackBarGreen,
      backgroundColor: Colors.white,
      titleText: Text(
        "OTP Sent",
        style: textTheme.bodyLarge,
      ),
      messageText: Text(
        state.msg ?? "",
        style: textTheme.bodySmall?.copyWith(color: AppColor.subHeading),
      ),
      icon: const Icon(Icons.check, color: AppColor.snackBarGreen),
      duration: const Duration(seconds: 3),
    );
  }
}
