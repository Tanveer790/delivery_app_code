import 'package:delivery_app/screens/fourth_screen.dart';
import 'package:delivery_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/main_button.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool isChecked = false;
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
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
                    Form(
                      key: _formkey,
                        child:
                        Column(children: [
                          TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter Email';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter Password';
                          }
                          return null;
                        },
                      ),
                    ],)),
                    const SizedBox(height: 20,),
                    Row(children: [
                      Checkbox(value: isChecked, onChanged: (bool){
                        setState(() {
                          isChecked = true;
                        });
                      }),
                      Expanded(
                          child: Text('Remember me')),
                      SizedBox(width: 85,),
                      Expanded(
                          child: Text('Forgot Password?', style: TextStyle(decoration: TextDecoration.underline),))
                    ],
                    ),
                     RoundButton(
                       loading: loading,
                      onTap: (){
                        if(_formkey.currentState!.validate()){
                          setState(() {
                            loading = true;
                          });
                           try{
                             auth.createUserWithEmailAndPassword(
                                 email: emailController.text.toString(),
                                 password: passwordController.text.toString());
                             setState(() {
                               loading = false;
                             });
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                           }catch(e){
                            setState(() {
                              loading = false;
                            });
                           }
                        }
                      },
                        title: 'Sign In'
                    ),
                    SizedBox(height: 20,),
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
                        Expanded(child: Divider(
                          color: Colors.black,
                          thickness: 2,
                          indent: 3,
                        ))
                      ],
                    ),
                    SizedBox(height: 40,),
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
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> FourthScreen()));
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
