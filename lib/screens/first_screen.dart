import 'package:delivery_app/screens/fourth_screen.dart';
import 'package:delivery_app/screens/second_screen.dart';
import 'package:delivery_app/screens/third_screen.dart';
import 'package:delivery_app/widgets/main_button.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange.shade200,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 240,
              ),
              RoundButton(
                onTap: () {
                  setState(() {
                    loading = true;
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ThirdScreen()));
                },
                title: 'Sign In via Email',
                textColor: Colors.white,
                color: Colors.black12,
                prefix: Icons.email,
              ),
              const SizedBox(
                height: 20,
              ),
              RoundButton(
                onTap: () {
                  setState(() {
                    loading = true;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FourthScreen()));
                },
                title: 'Sign In via Phone Number',
                textColor: Colors.white,
                color: Colors.black12,
                prefix: Icons.phone,
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 2,
                      endIndent: 3,
                    ),
                  ),
                  Text('or continue with'),
                  Expanded(
                      child: Divider(
                    color: Colors.white,
                    thickness: 2,
                    indent: 3,
                  ))
                ],
              ),
              const SizedBox(
                height: 40,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.orange.shade200,
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
              RoundButton(
                onTap: () {},
                title: 'Continue As Guest',
                textColor: Colors.black,
                color: Colors.white,
              ),
              const SizedBox(
                height: 30,
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
                              builder: (context) => SignUpScreen()));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
