import 'package:delivery_app/screens/home_screen.dart';
import 'package:delivery_app/utilities/toast_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/main_button.dart';

class PhoneVerification extends StatefulWidget {
  final String verificationId;
  const PhoneVerification({super.key, required this.verificationId});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  bool isChecked = false;
  bool loading = false;
  TextEditingController verifyCode = TextEditingController();
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
                    Text('Verification', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                    SizedBox(height: 160,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          TextFormField(
                            controller: verifyCode,
                            decoration: const InputDecoration(
                              hintText: '6 Digit Code',
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Enter code';
                              }
                              return null;
                            },
                          ),
                        ],),
                    Center(child: SizedBox(height: 20,)),
                    RoundButton(
                        loading: loading,
                        onTap: ()async{
                          final credential = PhoneAuthProvider.credential(
                              verificationId: widget.verificationId,
                              smsCode: verifyCode.text.toString());
                          try{
                            await auth.signInWithCredential(credential);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                          }catch(e){
                            Utils().toastMessage(e.toString());
                          }
                        },
                        title: 'verify'
                    ),
                  ]),
            ),
          )
        ],
      ),
    );

  }
}
