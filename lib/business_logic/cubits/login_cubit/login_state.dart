part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class NumberLengthIsCorrect extends LoginState {}

class OtpSent extends LoginState {
  final String? num;
  final String? msg;
  OtpSent(this.msg, this.num);
}

class OtpVerified extends LoginState {
  final StudentData? studentData;
  final String? token;
  final String? msg;
  
  OtpVerified(this.studentData, this.token, this.msg);
}

class OtpError extends LoginState {
  final String error;
  OtpError(this.error);
}

