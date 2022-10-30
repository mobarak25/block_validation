import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc(this.context) : super(OtpInitial()) {
    on<OneOtpChange>(_oneOtpChange);
    on<TwoOtpChange>(_twoOtpChange);
    on<ThreeOtpChange>(_threeOtpChange);
    on<FourOtpChange>(_fourOtpChange);
    on<FiveOtpChange>(_fiveOtpChange);
    on<SixOtpChange>(_sixOtpChange);
  }

  final BuildContext context;

  FutureOr<void> _oneOtpChange(OneOtpChange event, Emitter<OtpState> emit) {
    emit(state.copyOfState(oneOtpState: event.oneOtpValue));
    if (event.oneOtpValue.isNotEmpty && state.twoOtpState.isEmpty) {
      setFocus(node: event.nextNode);
    }
    buttonFocus(emit);
  }

  FutureOr<void> _twoOtpChange(TwoOtpChange event, Emitter<OtpState> emit) {
    emit(state.copyOfState(twoOtpState: event.twoOtpValue));
    if (event.twoOtpValue.isNotEmpty && state.threeOtpState.isEmpty) {
      setFocus(node: event.nextNode);
    } else {
      setFocus(node: event.prevNode);
    }
    buttonFocus(emit);
  }

  FutureOr<void> _threeOtpChange(ThreeOtpChange event, Emitter<OtpState> emit) {
    emit(state.copyOfState(threeOtpState: event.threeOtpValue));
    if (event.threeOtpValue.isNotEmpty && state.fourOtpState.isEmpty) {
      setFocus(node: event.nextNode);
    } else {
      setFocus(node: event.prevNode);
    }
    buttonFocus(emit);
  }

  FutureOr<void> _fourOtpChange(FourOtpChange event, Emitter<OtpState> emit) {
    emit(state.copyOfState(fourOtpState: event.fourOtpValue));
    if (event.fourOtpValue.isNotEmpty && state.fiveOtpState.isEmpty) {
      setFocus(node: event.nextNode);
    } else {
      setFocus(node: event.prevNode);
    }
    buttonFocus(emit);
  }

  FutureOr<void> _fiveOtpChange(FiveOtpChange event, Emitter<OtpState> emit) {
    emit(state.copyOfState(fiveOtpState: event.fiveOtpValue));
    if (event.fiveOtpValue.isNotEmpty && state.sixOtpState.isEmpty) {
      setFocus(node: event.nextNode);
    } else {
      setFocus(node: event.prevNode);
    }
    buttonFocus(emit);
  }

  FutureOr<void> _sixOtpChange(SixOtpChange event, Emitter<OtpState> emit) {
    emit(state.copyOfState(sixOtpState: event.sixOtpValue));
    if (event.sixOtpValue.isNotEmpty) {
      setFocus(node: FocusNode());
    } else {
      setFocus(node: event.prevNode);
    }
    buttonFocus(emit);
  }

  setFocus({required FocusNode node}) {
    FocusScope.of(context).requestFocus(node);
  }

  buttonFocus(Emitter<OtpState> emit) {
    if (state.oneOtpState.isNotEmpty &&
        state.twoOtpState.isNotEmpty &&
        state.threeOtpState.isNotEmpty &&
        state.fourOtpState.isNotEmpty &&
        state.fiveOtpState.isNotEmpty &&
        state.sixOtpState.isNotEmpty) {
      emit(state.copyOfState(isBtnActive: true));
    } else {
      emit(state.copyOfState(isBtnActive: false));
    }
  }
}
