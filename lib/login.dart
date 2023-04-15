import 'package:flutter/material.dart';
import './register.dart';

class login extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    var username = arguments?['Username'];
    var password = arguments?['password'];
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_nameController.text == username &&
                      _passwordController.text == password) {
                    Navigator.pushNamed(context, '/bmi',
                            arguments: {'Username': username})
                        .then((value) => {
                              if (value == true)
                                {Navigator.of(context).pop()}
                            });
                            showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Login Success'),
                                content: Text('Welcome ${_nameController.text}'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK',style: TextStyle(
      color: Colors.white)),
                                    
                                    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
  ),
                                  ),
                                ],
                              );
                            },
                          );
                  } else if (_nameController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                              // ignore: prefer_const_constructors
                      SnackBar(
                        content: Text('Username or Password Required'),
                        backgroundColor: Colors.red,
                      ),
                            );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      // ignore: prefer_const_constructors
                      SnackBar(
                        content: Text('Username or Password Invalid'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
  ),
              ), 
              SizedBox(height: 16),
              Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Dont have a Account?',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register(),
                              ));
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  )
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/second');
              //     // do login process here
              //   },
              //   child: Text('Daftar'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
