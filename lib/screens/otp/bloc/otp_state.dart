part of 'otp_bloc.dart';

class OtpState extends Equatable {
  const OtpState({
    this.oneOtpState = '',
    this.twoOtpState = '',
    this.threeOtpState = '',
    this.fourOtpState = '',
    this.fiveOtpState = '',
    this.sixOtpState = '',
    this.isBtnActive = false,
  });
  final String oneOtpState;
  final String twoOtpState;
  final String threeOtpState;
  final String fourOtpState;
  final String fiveOtpState;
  final String sixOtpState;
  final bool isBtnActive;

  OtpState copyOfState({
    bool? isBtnActive,
    String? oneOtpState,
    String? twoOtpState,
    String? threeOtpState,
    String? fourOtpState,
    String? fiveOtpState,
    String? sixOtpState,
  }) {
    return OtpState(
      isBtnActive: isBtnActive ?? this.isBtnActive,
      oneOtpState: oneOtpState ?? this.oneOtpState,
      twoOtpState: twoOtpState ?? this.twoOtpState,
      threeOtpState: threeOtpState ?? this.threeOtpState,
      fourOtpState: fourOtpState ?? this.fourOtpState,
      fiveOtpState: fiveOtpState ?? this.fiveOtpState,
      sixOtpState: sixOtpState ?? this.sixOtpState,
    );
  }

  @override
  List<Object> get props => [
        oneOtpState,
        twoOtpState,
        threeOtpState,
        fourOtpState,
        fiveOtpState,
        sixOtpState,
        isBtnActive
      ];
}

class OtpInitial extends OtpState {}
