import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MianScreen extends StatefulWidget {
  @override
  _MianScreenState createState() => _MianScreenState();
}

class _MianScreenState extends State<MianScreen> {
  String name = '';

  TextEditingController _myConroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _setData();
  }

  Future<String> _loadData() async {
    SharedPreferences prf = await SharedPreferences.getInstance();

    return prf.getString('name');
  }

  Future<bool> _safeData() async {
    SharedPreferences prf = await SharedPreferences.getInstance();

    return prf.setString('name', _myConroller.text);
  }

  _setData() {
    _loadData().then((value) => {
          setState(() {
            name = value;
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Preferenced Example'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _myConroller,
              decoration: InputDecoration(hintText: 'input value Here'),
            ),
            ElevatedButton(
              onPressed: () {
                _safeData();
              },
              child: Text('Safe name'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(name),
            ),
            ElevatedButton(
              onPressed: () {
                _setData();
              },
              child: Text('Load Data'),
            ),
          ],
        ),
      ),
    );
  }
}
