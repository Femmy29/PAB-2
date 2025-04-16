import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dbRef = FirebaseDatabase.instance.ref().child('data');
  final dataController = TextEditingController();
  List<String> dataList = [];

  void simpanData() async {
    if (dataController.text.isEmpty) return;
    await dbRef.push().set({'value': dataController.text});
    dataController.clear();
    ambilData();
  }

  void ambilData() async {
    final snapshot = await dbRef.get();
    List<String> newData = [];
    if (snapshot.exists) {
      final items = Map<String, dynamic>.from(snapshot.value as Map);
      items.forEach((key, value) {
        newData.add(value['value']);
      });
    }
    setState(() {
      dataList = newData;
    });
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
    ambilData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realtime Database'),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: logout),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: dataController,
              decoration: InputDecoration(
                labelText: 'Masukkan Data',
                suffixIcon:
                    IconButton(icon: Icon(Icons.send), onPressed: simpanData),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(dataList[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
