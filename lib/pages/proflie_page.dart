import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapps/components/app_color.dart';
import 'package:todoapps/pages/changepassword.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = '';
  String name = '';
  int age = 0;
  String gender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
              onChanged: (value) {
                setState(() {
                  age = int.parse(value);
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Gender',
              ),
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmation'),
                      content: Text('Are you sure you want to save?'),
                      actions: [
                        TextButton(
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: AppColor.red),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text(
                            'Save',
                            style: TextStyle(color: AppColor.blue),
                          ),
                          onPressed: () {
                            // Perform save operation here
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Save', style: TextStyle(color: AppColor.blue)),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangePassword(
                            title: '',
                          )),
                );
              },
              child: const Text('Change Password',
                  style: TextStyle(color: AppColor.orange)),
            ),
          ],
        ),
      ),
    );
  }
}
