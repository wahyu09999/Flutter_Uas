import 'package:flutter/material.dart';
import 'package:flutter_uas/screen/auth/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
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
            'Login Page',
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          SizedBox(
            height: 40,
          ),
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
            child: Text('Login'),
          ),
          SizedBox(
            height: 10,
          ),
          Text('Dont Have Account?'),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                );
              },
              child: Text('Register')),
        ],
      ),
    ));
  }
}
