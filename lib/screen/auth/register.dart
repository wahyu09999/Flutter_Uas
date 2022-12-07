import 'package:flutter/material.dart';
import 'package:flutter_uas/screen/auth/login.dart';

import '../../network/api.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _Register();
}



class _Register extends State<Register> {

  final TextEditingController txtName = TextEditingController(text: 'test');
  final TextEditingController txtEmail = TextEditingController(text: 'test@mail.com');
  final TextEditingController txtPassword = TextEditingController(text: 'password');


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
            controller:txtName,
            decoration: InputDecoration(label: Text('Name')),
          ),
          SizedBox(
            height: 10,),
          TextFormField(
            controller:txtEmail,
            decoration: InputDecoration(label: Text('Email')),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller:txtPassword,
            decoration: InputDecoration(label: Text('Passwrd')),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed:() {
              doRegister();
            },
            child: Text('Register'),
          ),
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
  Future doRegister() async{
  final name = txtName.text;
  final email = txtEmail.text;
  final password = txtPassword.text;
  final deviceId = "12345";
  final response = await HttpHelper().register(name, email, password, deviceId);
  print(response.body);
  Navigator.pushNamed(context, "/");
}
}
