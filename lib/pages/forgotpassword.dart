import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapps/components/app_button.dart';
import 'package:todoapps/components/app_textfield.dart';
import 'package:todoapps/controllers/user.dart';
import 'package:todoapps/pages/login.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({super.key, required this.title});
  final String title;
  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  TextEditingController uesnameController = TextEditingController();
  TextEditingController passwordsNewController = TextEditingController();
  TextEditingController passwordsNewConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                      "Forgot Password ",
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            const Icon(Icons.accessibility, color: Colors.grey),
                        hintText: "Enter Username",
                        textInputAction: TextInputAction.next,
                        isPasswords: false,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "New Password",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextField(
                        controller: passwordsNewController,
                        isPasswords: true,
                        prefixicon:
                            const Icon(Icons.ac_unit, color: Colors.grey),
                        hintText: "Enter new Password",
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextField(
                        controller: passwordsNewConfirmController,
                        isPasswords: true,
                        prefixicon:
                            const Icon(Icons.ac_unit, color: Colors.grey),
                        hintText: "Enter Confirm Password",
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.4,
                      child: AppTextButton(
                        onpress: () {
                          String uesname = uesnameController.text.trim();
                          if (uesname == User.username) {
                            if (passwordsNewController.text.trim() ==
                                passwordsNewConfirmController.text.trim()) {
                              Authen.password =
                                  passwordsNewController.text.trim();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Change password success',
                                  ),
                                ),
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => loginPages(
                                            title: '',
                                          )));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'New password not match confirm password',
                                  ),
                                ),
                              );
                            }
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please enter both username',
                                ),
                              ),
                            );
                          }
                        },
                        text: "Next",
                        textColor: Colors.white,
                        color: Colors.blue,
                        borderColor: Colors.blue,
                        height: 50,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
