import 'package:flutter/material.dart';
import 'package:flutter_uas/screen/auth/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(22),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.lightBlue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Register Page',
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          SizedBox(
            height: 40,
          ),
          TextFormField(
            decoration: InputDecoration(label: Text('Name')),
          ),
          SizedBox(
            height: 10,),
          TextFormField(
            decoration: InputDecoration(label: Text('Username')),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(label: Text('Passwrd')),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () => '',
            child: Text('Register'),
          ),
          SizedBox(
            height: 10,
          ),
          Text('Dont Have Account?'),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
          }, child: Text('Login')),
          
        ],
      ),
    ));
  }
}
