import 'package:delivery_app/screens/third_screen.dart';
import 'package:delivery_app/widgets/main_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orange,
      body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange ),
              ),
            ),
            const Image(
                image: AssetImage('assets/images/bargarr.jpg'),
            ),
            Container(
              height: 566.70,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height:4,),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Sign In', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),)),
                    SizedBox(height: 20,),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'First Name',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',

                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email Address',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Referral Code (Optional)',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 20.0, ),
                      child: Text('BY trapping in Sign Up you are indicating that'),),
                    const Text(' you have read the privacy policy and agree to'),
                    const Text('the terms and services'),
                    const SizedBox(height: 20,),
                     RoundButton(
                      onTap: (){},
                        title: 'Sign Up'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ThirdScreen()));
                      },
                      child: const Text('Sign In',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
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
