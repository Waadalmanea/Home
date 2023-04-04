import 'package:flutter/material.dart';
import 'package:ratq_appp/screens/forgotpassword.dart';
import 'package:ratq_appp/screens/home_screen.dart';
import 'package:ratq_appp/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class logInScreen extends StatefulWidget {
  const logInScreen({super.key});

  @override
  State<logInScreen> createState() => _logInScreenState();
}

class _logInScreenState extends State<logInScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        titleTextStyle: TextStyle(
            color: Color(0xffeaece1),
            fontWeight: FontWeight.bold,
            fontSize: 20),
        backgroundColor: Color(0xff8DB792),
        toolbarHeight: 70,
        leading: IconButton(
          iconSize: 15,
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xffeaece1),
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffEAECE1),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //اجرب هذا جديدmainAxisAlignment: MainAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //text
              Center(
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 50), //مسافه بين كلمة ساين اب و التكست فيلد

              //text feild

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 29, vertical: 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '   Enter your email',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 29, vertical: 1),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '   Enter your password',
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25),

              // button
              Center(
                child: MaterialButton(
                    elevation: 5.0,
                    color: Color(0xff8DB792),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 40),
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Color.fromRGBO(234, 236, 225, 0.85),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    onPressed: () async {
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);

                        if (user != null) {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return homeScreen();
                          }));
                        }
                      } catch (e) {
                        print(e);
                      }
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              //fogot password

              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const Password();
                  }));
                },
                child: const Text(
                  '                                 Forget the Password?                                                 ',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const signUpScreen();
                  }));
                },
                child: Center(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
