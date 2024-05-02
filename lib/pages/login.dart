import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapps/components/app_boder.dart';
import 'package:todoapps/components/app_button.dart';
import 'package:todoapps/components/app_textfield.dart';
import 'package:todoapps/controllers/user.dart';
import 'package:todoapps/pages/forgotpassword.dart';
import 'package:todoapps/pages/home_page.dart';
import 'package:todoapps/pages/process_page.dart';
import 'package:todoapps/pages/register.dart';

class loginPages extends StatefulWidget {
  const loginPages({super.key, required this.title});
  final String title;
  @override
  State<loginPages> createState() => _loginPagesState();
}

class _loginPagesState extends State<loginPages> {
  TextEditingController uesnameController = TextEditingController();
  TextEditingController passwordsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Username",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextField(
                        controller: uesnameController,
                        prefixicon:
                            const Icon(Icons.person, color: Colors.grey),
                        hintText: "Enter Username",
                        textInputAction: TextInputAction.next,
                        isPasswords: false,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Password",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextField(
                        controller: passwordsController,
                        isPasswords: true,
                        prefixicon: const Icon(Icons.lock, color: Colors.grey),
                        hintText: "Enter Password",
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.4,
                      child: AppTextButton(
                        onpress: () {
                          String uesname = uesnameController.text.trim();
                          String passwords = passwordsController.text;
                          if (uesname == Authen.username &&
                              passwords == Authen.password) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Login success',
                                ),
                              ),
                            );
                            User.username = uesname;
                            User.password = passwords;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoadingPage()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please enter both username and password',
                                ),
                              ),
                            );
                          }
                        },
                        text: "Login",
                        textColor: Colors.white,
                        color: Colors.blue,
                        borderColor: Colors.blue,
                        height: 50,
                      ),
                    ),
                    const SizedBox(height: 70),
                    // or continue with
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoadingPage()));
                          },
                          child: const AppBoder(
                              imagePath: 'assets/images/apple.png'),
                        ),
                        const SizedBox(width: 25),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoadingPage()));
                          },
                          child: const AppBoder(
                              imagePath: 'assets/images/google.png'),
                        ),
                        const SizedBox(width: 25),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoadingPage()));
                          },
                          child: const AppBoder(
                              imagePath: 'assets/images/instagram.jpg'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              right: 20,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const forgotpassword(title: ''))),
                      child: const Text(
                        'Forgot password ? |',
                      )),
                  GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const register(title: ''))),
                      child: const Text(
                        ' register',
                        style: TextStyle(color: Colors.red),
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
