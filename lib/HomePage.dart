import 'package:flutter/material.dart';
import 'package:login/user.dart';

bool isSecured = true;
Map<String, User> users = {
  'sumayah@gmail.com': User(email: 'sumayah@gmail.com', password: '4444'),
  'hajer@gmail.com': User(email: 'sumayah@gmail.com', password: '333'),
};

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text(
            'login page',
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/login.png',
                width: 350,
                height: 350,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          label: Text('Enter Your Email'),
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: isSecured,
                      decoration: InputDecoration(
                          label: Text('Enter Your Password'),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isSecured = !isSecured;
                                });
                              },
                              icon: Icon(Icons.remove_red_eye)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          )),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        String email = emailController.text;
                        String password = passwordController.text;
                        User user = users[emailController.text]!;
                        if (user.email == emailController.text &&
                            user.password == passwordController.text) {
                          print('logged ');
                        } else {
                          print('wrong email or password');
                        }
                      },
                      child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.purple,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 26),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.login,
                                color: Colors.white,
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
