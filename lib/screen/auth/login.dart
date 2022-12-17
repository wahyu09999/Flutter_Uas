import 'package:flutter/material.dart';
import 'package:flutter_uas/screen/auth/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../network/api.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
    Future doLogin() async{
  final email = txtEmail.text;
  final password = txtPassword.text;
  final deviceId = "12345";
  final response = await HttpHelper().login(email, password, deviceId);
  print(response.body);
  SharedPreferences pref = await SharedPreferences.getInstance();
    const key = 'token';
    final value = pref.get(key);
    final token = value;
    // print(token);
    // if (token == null) {
    //   Navigator.pushNamed(
    //     context,
    //     '/',
    //   );
    // } else {
      Navigator.pushNamed(
        context,
        '/Home',
);
// }
}

final txtEmail = TextEditingController(text : 'superadmin@gmail.com');
  final txtPassword = TextEditingController(text : 'password');

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
            controller: txtEmail,
            decoration: InputDecoration(label: Text('Username')),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller:txtPassword ,
            decoration: InputDecoration(label: Text('Passwrd')),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed:() {
              doLogin();
            }, 
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
