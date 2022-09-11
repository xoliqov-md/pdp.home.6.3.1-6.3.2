import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:untitled/data/base.dart';
import 'package:untitled/models/user_model.dart';
import 'package:untitled/ui/registr_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ru', 'RU'),
          Locale('uz', 'UZ')
        ],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Pref.addUser(User(name: 'asdasd', email: 'asdasd', password: 'asdasdsad', number: 'adsasdassdad'));
    Pref.loadUser();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const FittedBox(
                child: Image(
                  width: 200,
                    image: AssetImage('assets/images/img.jpg'
                    )
              )
            ),
            FittedBox(
              child: Text(
                'welcome',
                style:
                    GoogleFonts.rubik(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
              ).tr(),
            ),
            const Text('aboutLogIn').tr(),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: email,
                      decoration: const InputDecoration(
                        hintText: 'Your email address ',
                        prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)))),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: password,
                      decoration: const InputDecoration(
                        hintText: 'Your password ',
                        prefixIcon: Icon(Icons.lock_open_rounded),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30),),
                          )
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      'forgot',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ).tr(),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style:  ElevatedButton.styleFrom(
                  shadowColor: Colors.indigo,
                  elevation: 15,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  padding: const EdgeInsets.only(left: 30,right: 30,top: 15,bottom: 15),
                  backgroundColor: Colors.indigo
                ),
                onPressed: (){},
                child: const Text(
                    'login',
                ).tr(),
              ),
            ),
            const Text(
                'or using',
              style: TextStyle(
                color: Colors.grey
              ),
            ).tr(),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      backgroundColor: Colors.indigoAccent
                    ),
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(7),
                            child: const Icon(
                                Icons.facebook
                            ),
                          ),
                          const Text(
                              'Facebook'
                          )
                        ],
                      )
                  ),
                  const SizedBox(width: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      backgroundColor: Colors.red
                    ),
                      onPressed: (){},
                      child: Row(
                        children: const [
                            Icon(Icons.g_mobiledata),
                            Text('Google')
                        ],
                      )
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('t-have-account').tr(),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: GestureDetector(
                        child: OpenContainer(
                          openElevation: 0.0,
                          closedBuilder: (BuildContext context, void Function() action) {
                            return const Text(
                              style: TextStyle(
                                color: Colors.indigoAccent
                              ),
                                'sign-up'
                            ).tr();
                          }, openBuilder: (BuildContext context, void Function({Object? returnValue}) action) {
                            return const RegistrationPage();
                        },
                        )
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
