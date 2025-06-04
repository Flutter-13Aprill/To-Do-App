import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/extention/extention.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todoapp/intro/bloc/introbording_bloc.dart';
import 'package:todoapp/intro/Screens/welcome.dart';
import 'package:todoapp/intro/model/data_model.dart';
import 'package:todoapp/intro/widgets/next_button.dart';
import 'package:todoapp/login_register/screens/login_screen.dart';
import 'package:todoapp/login_register/screens/register.dart';
import 'package:todoapp/theems/colors.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  final PageController _controler = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntrobordingBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<IntrobordingBloc>();
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Welcome()),
                    );
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: MyAppColor.white),
                    textAlign: TextAlign.left,
                  ),
                ),
                Center(
                  child: BlocBuilder<IntrobordingBloc, IntrobordingState>(
                    builder: (context, state) {
                      int currentindex = 0;
                      if (state is changethepagestate) {
                        currentindex = state.index;
                      }
                      return Column(
                        children: [
                          SizedBox(
                            height: context.gethight() / 1.1,
                            width: context.getWidth(),
                            child: PageView.builder(
                              controller: _controler,
                              itemCount: pages.length,
                              onPageChanged: (index) {
                                bloc.add(changepage(index: index));
                              },
                              itemBuilder: (context, index) {
                                final item = pages[index];

                                return Column(
                                  children: [
                                    SizedBox(height: 40),
                                    Image.asset(item.image),
                                    SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(pages.length, (
                                        i,
                                      ) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 4,
                                          ),
                                          width: i == currentindex ? 20 : 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: i == currentindex
                                                ? Colors.grey
                                                : Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                    SizedBox(height: 30),
                                    Text(
                                      item.title,
                                      style: TextStyle(
                                        color: MyAppColor.white,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(height: 30),
                                    Text(
                                      item.desc,
                                      style: TextStyle(
                                        color: MyAppColor.white,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            _controler.previousPage(
                                              duration: Duration(
                                                microseconds: 300,
                                              ),
                                              curve: Curves.bounceInOut,
                                            );
                                          },
                                          child: Text("Back"),
                                        ),

                                        NextButton(
                                          button_text: 'Next',
                                          onPressed: () {
                                            if (currentindex ==
                                                pages.length - 1) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Welcome(),
                                                ),
                                              );
                                            } else {
                                              _controler.nextPage(
                                                duration: Duration(
                                                  microseconds: 300,
                                                ),
                                                curve: Curves.bounceInOut,
                                              );
                                            }
                                          },
                                          textColor: MyAppColor.pur,
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
