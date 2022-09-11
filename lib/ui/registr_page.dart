import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/data/base.dart';
import 'package:untitled/data/controller.dart';
import 'package:untitled/models/user_model.dart';
import 'package:untitled/ui/users_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: FloatingActionButton(
          backgroundColor: Colors.white,
          focusElevation: 0.0,
          highlightElevation: 0.0,
          enableFeedback: false,
          onPressed: () {
            Navigator.pop(context);
          },
          elevation: 0,
          focusColor: Colors.white,
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(''),
      ),
      body: Column(
        children: [
          const Spacer(),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: FittedBox(
              child: Text(
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.bold, fontSize: 30),
                      'registration-title')
                  .tr(),
            ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: FittedBox(
              child: const Text(
                      style: TextStyle(color: Colors.grey), 'aboutRegistration')
                  .tr(),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: TextController.name,
                      decoration: const InputDecoration(
                          hintText: 'Your name ',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: TextController.email,
                      decoration: const InputDecoration(
                          hintText: 'Your email ',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: TextController.number,
                      decoration: const InputDecoration(
                          hintText: 'Your phone number ',
                          prefixIcon: Icon(Icons.phone_android),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: TextController.password,
                      decoration: const InputDecoration(
                          hintText: 'Your password ',
                          prefixIcon: Icon(Icons.lock_open_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: TextController.confirmPassword,
                      decoration: const InputDecoration(
                          hintText: 'Your confirm password ',
                          prefixIcon: Icon(Icons.lock_open_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                if (TextController.name.text.isEmpty ||
                    TextController.email.text.isEmpty ||
                    TextController.number.text.isEmpty ||
                    TextController.password.text.isEmpty ||
                    TextController.confirmPassword.text.isEmpty) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'error-dialog'.tr(),
                    desc: 'about-error'.tr(),
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                } else if (TextController.password.text !=
                    TextController.confirmPassword.text) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'is-title'.tr(),
                    desc: 'about-is'.tr(),
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  const UsersPage(),));
                  _addUser();
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  padding: const EdgeInsets.only(
                      right: 30, left: 30, top: 15, bottom: 15),
                  shadowColor: Colors.indigoAccent,
                  elevation: 15,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)))),
              child: const Text('create').tr(),
            ),
          ),
          const Spacer(),
          Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('have-account').tr(),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Hero(
                      tag: 'log',
                      child: const Text(
                        'login-here',
                        style: TextStyle(color: Colors.indigoAccent),
                      ).tr(),
                    ),
                  )
                ],
              )),
          const Spacer(),
        ],
      ),
    );
  }
}
void _addUser() async{
    Pref.addUser(
        User(
            name: TextController.name.text,
            email: TextController.email.text,
            password: TextController.password.text,
            number: TextController.number.text
        )
    );
}