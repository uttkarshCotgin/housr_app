// Import required Dart packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:housr_app/Theme/theme_data.dart';

import '../../../business_logic/cubits/login_cubit/login_cubit.dart';
import '../../../utils/app_utils.dart';

import '../../widgets/CTA/cta_button_carousel.dart';
import '../../widgets/custom_loader.dart';
import '../../widgets/custom_textfield.dart';

// Controller for phone number input field
TextEditingController controller = TextEditingController();

// Login Screen Widget
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<LoginCubit, LoginState>(
        // Listener to handle state changes from the LoginCubit
        listener: (context, state) {
          // Show a snackbar when OTP is successfully sent
          if (state is OtpSent) {
            Get.showSnackbar(GetSnackBar(
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
            ));

            // Navigate to the OTP screen and pass the phone number as an argument
            Navigator.pushNamed(context, "/otp", arguments: controller.text);
            controller.clear();
          }
          // Show a snackbar when there is an error sending OTP
          else if (state is OtpError) {
            Get.showSnackbar(GetSnackBar(
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
              icon: const Icon(Icons.close, color: AppColor.ctaRedcolor),
              duration: const Duration(seconds: 3),
            ));
          }
        },
        // Builder to construct the UI based on the LoginState
        builder: (context, state) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Container(
                // Background image of the login screen
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.loginIcon,),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(AppImages.logo),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Title of the login screen
                              Text(
                                "Your Journey\nIn Your Hands",
                                style: myTheme.textTheme.titleLarge?.copyWith(color: AppColor.white, fontSize: 40),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              // Custom text field for entering phone number
                              CustomTextfield(
                                controller: controller,
                                hintText: 'Enter your Phone Number',
                                suffix: null,
                                onChanged: () {
                                  // Call the LoginCubit method to validate phone number length
                                  BlocProvider.of<LoginCubit>(context).numberLengthIsCorrect(controller.text);
                                },
                                onSubmitted: () {
                                  if (state is NumberLengthIsCorrect) {
                                    // Send OTP when the phone number length is correct
                                    BlocProvider.of<LoginCubit>(context).sendOtp(controller.text);
                                  } else {
                                    // Handle case when phone number length is incorrect
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // Show a loader or the CTA button based on the LoginState
                              state is LoginLoading
                                  ? const CustomLoader()
                                  : CtaCarouselButton(
                                title: "Submit",
                                onPressed: () {
                                  if (state is NumberLengthIsCorrect) {
                                    // Send OTP when the phone number length is correct
                                    BlocProvider.of<LoginCubit>(context).sendOtp(controller.text);
                                  } else {
                                    // Handle case when phone number length is incorrect
                                  }
                                  // Navigator.pushNamed(context, "/otp");
                                },
                                isEnable: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
