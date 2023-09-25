import 'package:delivery_app/screens/number_verification.dart';
import 'package:delivery_app/utilities/toast_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/main_button.dart';
import 'first_screen.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  bool isChecked = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.orange),
            ),
          ),
          const Image(
            image: AssetImage('assets/images/bargarr.jpg'),
          ),
          Container(
            height: 566.70,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                const SizedBox(
                  height: 4,
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign In',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    hintText: 'Phone Number',
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isChecked,
                        onChanged: (newbool) {
                          setState(() {
                            isChecked = true;
                          });
                        }),
                    const Expanded(child: Text('Remember me')),
                    const SizedBox(
                      width: 85,
                    ),
                    const Expanded(
                        child: Text(
                      'Forgot Password?',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ))
                  ],
                ),
                RoundButton
                  (onTap: () {
                    auth.verifyPhoneNumber(
                        verificationCompleted: (_){
                          phoneNumber : phoneController.text;
                          Utils().toastMessage('Done');
                        },
                        verificationFailed: (e){
                          Utils().toastMessage(e.toString());
                        },
                        codeSent: (String verificationId, int? token){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> PhoneVerification(verificationId: verificationId,), ));
                        },
                        codeAutoRetrievalTimeout: (e){
                          Utils().toastMessage(e.toString());
                        });
                },
                    title: 'Sign In'),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 2,
                        endIndent: 3,
                      ),
                    ),
                    Text('or continue with'),
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                      thickness: 2,
                      indent: 3,
                    ))
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/google.png'),
                      radius: 20,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      backgroundImage: AssetImage('assets/images/facebook.png'),
                      radius: 20,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FirstScreen()));
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
