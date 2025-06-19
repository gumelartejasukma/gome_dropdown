import 'package:flutter/material.dart';
import 'package:gome_dropdown/gome_dropdown.dart';

void main() {
  runApp(const MaterialApp(home: MyExample()));
}

class MyExample extends StatefulWidget {
  const MyExample({super.key});

  @override
  State<MyExample> createState() => _MyExampleState();
}

class _MyExampleState extends State<MyExample> {
  final items = ['Satu', 'Dua', 'Tiga'];
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Dropdown<String>(
          labelText: 'Pilih angka',
          items: items,
          selectedValue: selected,
          getName: (item) => item,
          onChanged: (val) => setState(() => selected = val),
        ),
      ),
    );
  }
}
