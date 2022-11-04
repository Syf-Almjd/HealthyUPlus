// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';


class profile extends StatefulWidget {
   profile({Key? key}) : super(key: key);
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  final userNameController = TextEditingController();
  final userAgeController = TextEditingController();
  final userSalaryController = TextEditingController();

  // late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    // dbRef = FirebaseDatabase.instance.ref().child('Students');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inserting data'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Inserting data in Firebase Realtime Database',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter Your Name',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userAgeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                  hintText: 'Enter Your Age',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userSalaryController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Salary',
                  hintText: 'Enter Your Salary',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  Map<String, String> students = {
                    'name': userNameController.text,
                    'age': userAgeController.text,
                    'salary': userSalaryController.text
                  };

                  // dbRef.push().set(students);
                },
                child: const Text('Insert Data'),
                color: Colors.blue,
                textColor: Colors.white,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}