// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:housr_app/ui/navigation_bar.dart';
import 'package:housr_app/ui/views/booking/booking_landing.dart';
import 'package:housr_app/ui/views/hotel/hotel_card_expanded.dart';
import 'package:housr_app/ui/views/login/otp_screen.dart';
import 'package:housr_app/ui/views/room/room_card_expanded.dart';

import 'business_logic/cubits/navigationBar_cubit/navigation_cubit.dart';
// import 'package:iamlearning/bussiness_logic/cubits/course_cubit/course_cubit.dart';
// import 'package:iamlearning/bussiness_logic/cubits/navigationBar_cubit/navigation_cubit.dart';
// import 'package:iamlearning/bussiness_logic/cubits/syllabus_cubit/syllabus_cubit.dart';
// import 'package:iamlearning/ui/shared/widgets/bottom_sheet.dart';
//
// import 'package:iamlearning/ui/shared/widgets/congrats_screen.dart';
// import 'package:iamlearning/ui/views/User/user_landing.dart';
// import 'package:iamlearning/ui/views/navigation_bar.dart';
// import 'package:iamlearning/ui/views/Onboarding/language_form.dart';
// import 'package:iamlearning/ui/views/Onboarding/select_exam_form.dart';
// import 'package:iamlearning/ui/views/Onboarding/subcourse_form.dart';
//
// import 'package:iamlearning/ui/views/Onboarding/form_screen.dart';
//
// import 'package:iamlearning/ui/views/Onboarding/onboarding_screen.dart';
//
// import 'package:iamlearning/ui/shared/loader_gif.dart';
//
// import 'package:iamlearning/ui/views/login/otp_screen.dart';
// import 'package:iamlearning/ui/views/practice/practice_landing.dart';
// import 'package:iamlearning/ui/views/practice/practice_subject_wise_car_landing.dart';
// import 'package:iamlearning/ui/views/practice/start_practice.dart';
// import 'package:iamlearning/ui/views/practice/start_practice_landing.dart';
// import 'package:iamlearning/ui/views/syllabus/pdf_landing.dart';
// import 'package:iamlearning/ui/views/syllabus/syllabus_landing.dart';
//
// import '../../bussiness_logic/cubits/login_cubit/login_cubit.dart';
// import 'CourseVideo/course_landing.dart';
// import 'StudyMaterial/studyMaterial_landing.dart';
// import 'User/user_profile_edit.dart';
// import 'login/login_screen.dart';

class Routes {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/homepage":
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => NavigationBarCubit(),
              ),
            ],
            child: const CustomNavigationBar(),
          ),
        );
    //
    //   case "/onboard":
    //     return MaterialPageRoute(
    //         builder: (context) => const OnboardingScreen());
    //
    //   case "/bottomSheet":
    //     return MaterialPageRoute(
    //       builder: (_) => const BottomSheetCustom(),
    //     );
    //
    //   case "/login":
    //     return MaterialPageRoute(
    //       builder: (_) => const LoginScreen(),
    //     );
    //
    //
    //   case "/form":
    //     return MaterialPageRoute(
    //       builder: (context) => const FormScreen(),
    //     );
    //
    //   case "/loader":
    //     return MaterialPageRoute(builder: (context) => const LoaderGif());
    //
    //   case "/congrats":
    //     return MaterialPageRoute(builder: (_) => const CongratsScreen());
    //
    //   case "/subcourseForms":
    //     return MaterialPageRoute(builder: (_) => SubCourseForms());
    //
    //   case "/languageForms":
    //     return MaterialPageRoute(builder: (_) => LanguageForms());
    //
    //   case "/selectExamForm":
    //     return MaterialPageRoute(builder: (_) => SelectExamForm());
    //
    //   case "/userProfileEdit":
    //     final args = settings.arguments as Map;
    //     return MaterialPageRoute(
    //       builder: (_) => UserProfileEdit(
    //         name: args["name"],
    //         email: args["email"],
    //         bio: args["bio"],
    //         mobile: args["mobile"],
    //         language: args["language"],
    //         goal: args["goal"],
    //       ),
    //     );
    //   case "/syllabusLanding":
    //     return MaterialPageRoute(
    //       builder: (context) => SyllabusLanding(),
    //     );
    //   case "/PracticeSubjectWiseCardLanding":
    //     return MaterialPageRoute(
    //       builder: (context) => PracticeSubjectWiseCardLanding(),
    //     );
    //   case "/StudyMaterialLanding":
    //     return MaterialPageRoute(
    //       builder: (context) => StudyMaterialLanding(),
    //     );
    //   case "/userLanding":
    //     return MaterialPageRoute(
    //       builder: (_) => const UserLanding(),
    //     );
    //   case "/practiceLanding":
    //     return MaterialPageRoute(
    //       builder: (_) => const PracticeListLanding(),
    //     );
    //   case "/StartPractice":
    //     final args = settings.arguments as Map;
    //
    //     return MaterialPageRoute(
    //       builder: (_) => StartPractice(
    //         cardIndex: args["cardIndex"],
    //         duration: args["duration"],
    //       ),
    //     );
    //   case "/courseLanding":
    //     final args = settings.arguments as Map;
    //     return MaterialPageRoute(
    //       builder: (_) => CourseLanding(title: args["title"]),
    //     );
    //   case "/pdfLanding":
    //     final args = settings.arguments as Map;
    //     return MaterialPageRoute(
    //       builder: (_) => PdfLanding(
    //         pdfLink: args["pdfLink"],
    //         title: args["title"],
    //       ),
    //     );
      case "/HotelCardExpanded":
        final args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => HotelCardExpanded(bG: args["bg"], index: args["index"],

          ),
        );
        case "/RoomExpanded":
        final args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => RoomCardExpanded(bG: args["bg"], index: args["index"],

          ),
        );

      case "/otp":
        final args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => OtpScreen(
              phoneNumber: args,
            ));

      case "/BookingLanding":
        final args = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) =>  BookingLanding(

            ));
  }
}}
