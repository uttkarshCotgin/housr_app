import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/Login/user_model.dart';
import '../../../data/repositories/Login/otp_repository.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  LoginCubit() : super( LoginInitial()){
  }


  OtpRepository otpRepository = OtpRepository();
  void sendOtp(String phoneNumber) async {
    emit(LoginLoading());
    try {
      UserModel response = await otpRepository.sendOtp({"mobile": phoneNumber});

      emit(OtpSent(response.msg, phoneNumber));
    } catch (ex) {
      emit(OtpError(ex.toString()));
    }
  }
  void checkJwt (String phoneNumber) async {
    emit(LoginLoading());
    try {
      UserModel response = await otpRepository.sendOtp({"mobile": phoneNumber});

      emit(OtpSent(response.msg, phoneNumber));
    } catch (ex) {
      emit(OtpError(ex.toString()));
    }
  }

  void verifyOtp(String phoneNumber, String otp) async {
    emit(LoginLoading());
     try {
      UserModelToken response =
          await otpRepository.verifyOtp({"mobile": phoneNumber, "otp": otp});
         


      emit(OtpVerified(response.studentData, response.token, response.msg));


    } catch (ex) {
      emit(OtpError(ex.toString()));
    }
  }

  void numberLengthIsCorrect(String phoneNumber) async {
    emit(NumberLengthIsCorrect());
  }
}
