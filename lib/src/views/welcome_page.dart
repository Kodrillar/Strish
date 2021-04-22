import 'package:strish/src/views/home.dart';
import 'package:flutter/material.dart';
import 'package:strish/src/widgets/gradient_button.dart';
import 'package:strish/src/utils/constants.dart';

class WelcomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController welcomeControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(30),
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/brain.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: welcomeControl,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Kindly enter some text!';
                        } else if (value.length > 8) {
                          return 'Oops, your name is too long!';
                        } else if (value.length < 2) {
                          return 'Kindly enter a valid name!';
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: kTextStyle.copyWith(color: kDeepPurple),
                        hintStyle: kTextStyle.copyWith(
                            color: kLightPurple.withOpacity(.7)),
                        hintText: 'Kindly input your name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  GradientButton(
                    buttonName: 'Start Trivia',
                    fontSize: 20,
                    onTapp: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Home(
                            userName: getName(),
                          );
                        }));
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getName() {
    String control = welcomeControl.text;
    return control;
  }
}
