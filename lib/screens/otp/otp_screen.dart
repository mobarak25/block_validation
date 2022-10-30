import 'package:block_validation/screens/otp/bloc/otp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode one = FocusNode();
    final FocusNode two = FocusNode();
    final FocusNode three = FocusNode();
    final FocusNode four = FocusNode();
    final FocusNode five = FocusNode();
    final FocusNode six = FocusNode();

    return BlocProvider(
      create: (context) => OtpBloc(context),
      child: Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<OtpBloc, OtpState>(
              builder: (context, state) {
                final bloc = context.read<OtpBloc>();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: TextField(
                            focusNode: one,
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black45),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black45),
                              ),
                            ),
                            onChanged: (value) {
                              bloc.add(OneOtpChange(
                                  oneOtpValue: value, nextNode: two));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: TextField(
                            focusNode: two,
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black45),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black45),
                              ),
                            ),
                            onChanged: (value) {
                              bloc.add(TwoOtpChange(
                                  twoOtpValue: value,
                                  nextNode: three,
                                  prevNode: one));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: TextField(
                            focusNode: three,
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black45),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black45),
                              ),
                            ),
                            onChanged: (value) {
                              bloc.add(ThreeOtpChange(
                                  threeOtpValue: value,
                                  nextNode: four,
                                  prevNode: two));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: TextField(
                            focusNode: four,
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black45),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black45),
                              ),
                            ),
                            onChanged: (value) {
                              bloc.add(FourOtpChange(
                                  fourOtpValue: value,
                                  nextNode: five,
                                  prevNode: three));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: TextField(
                            focusNode: five,
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black45),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black45),
                              ),
                            ),
                            onChanged: (value) {
                              bloc.add(FiveOtpChange(
                                  fiveOtpValue: value,
                                  nextNode: six,
                                  prevNode: four));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: TextField(
                            focusNode: six,
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black45),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black45),
                              ),
                            ),
                            onChanged: (value) {
                              bloc.add(SixOtpChange(
                                  sixOtpValue: value, prevNode: five));
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "get-api");
                      },
                      child: Ink(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: state.isBtnActive ? Colors.amber : Colors.grey,
                        ),
                        child: const Center(child: Text("GET API")),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "post-api");
                      },
                      child: Ink(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: state.isBtnActive ? Colors.amber : Colors.grey,
                        ),
                        child: const Center(child: Text("POST API")),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
