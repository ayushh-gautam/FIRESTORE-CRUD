import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testt/read.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final number = TextEditingController();
// First stage of CRUD i.e. CREATE..
  void saveData() {
    FirebaseFirestore.instance.collection('users').doc().set({
      'name': nameController.text.trim(),
      'address': addressController.text.trim(),
      'number': number.text.trim()
    });
    nameController.clear();
    addressController.clear();
    number.clear();
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  void updateData() async {
    await users
        .doc('8SSZztyIcM9UD3Qsplsu')
        .update({'name': nameController.text.trim()});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: addressController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: number,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  saveData();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReadPage()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 130, //nothing here
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.green),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  updateData();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReadPage()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.green),
                  child: Text(
                    'Update',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
