part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class OneOtpChange extends OtpEvent {
  final String oneOtpValue;
  final FocusNode nextNode;

  const OneOtpChange({required this.oneOtpValue, required this.nextNode});
}

class TwoOtpChange extends OtpEvent {
  const TwoOtpChange(
      {required this.twoOtpValue,
      required this.nextNode,
      required this.prevNode});

  final String twoOtpValue;
  final FocusNode nextNode;
  final FocusNode prevNode;
}

class ThreeOtpChange extends OtpEvent {
  const ThreeOtpChange(
      {required this.threeOtpValue,
      required this.nextNode,
      required this.prevNode});
  final String threeOtpValue;
  final FocusNode nextNode;
  final FocusNode prevNode;
}

class FourOtpChange extends OtpEvent {
  const FourOtpChange(
      {required this.fourOtpValue,
      required this.nextNode,
      required this.prevNode});
  final String fourOtpValue;
  final FocusNode nextNode;
  final FocusNode prevNode;
}

class FiveOtpChange extends OtpEvent {
  const FiveOtpChange(
      {required this.fiveOtpValue,
      required this.nextNode,
      required this.prevNode});
  final String fiveOtpValue;
  final FocusNode nextNode;
  final FocusNode prevNode;
}

class SixOtpChange extends OtpEvent {
  const SixOtpChange({required this.sixOtpValue, required this.prevNode});
  final String sixOtpValue;
  final FocusNode prevNode;
}

class SubmitOtpPressed extends OtpEvent {
  final String oneOtp;
  final String twoOtp;
  final String threeOtp;
  final String fourOtp;
  final String fiveOtp;
  final String sixOtp;

  const SubmitOtpPressed(
      {required this.oneOtp,
      required this.twoOtp,
      required this.threeOtp,
      required this.fourOtp,
      required this.fiveOtp,
      required this.sixOtp});
}
