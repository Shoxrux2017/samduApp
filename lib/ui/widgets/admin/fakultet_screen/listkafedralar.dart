// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:samduapp/domain/entity/teacher.dart';

class ListKafedralar extends StatefulWidget {
  final String titleKafedra;
  final int kafedraId;

  const ListKafedralar(
      {super.key, required this.titleKafedra, required this.kafedraId});

  @override
  State<ListKafedralar> createState() => _ListKafedralarState();
}

class _ListKafedralarState extends State<ListKafedralar> {
  final List<dynamic> _teacherList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleKafedra),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: _teacherList.length,
          itemBuilder: (BuildContext context, int index) {
            Teacher teacher = _teacherList[index];
            return ExpansionTile(
              title: Text(
                teacher.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              children: [
                ListTile(
                  title: const Text("Yuklama"),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Upload(
                    //             titleFile: "O'quv Reja",
                    //             teacherId: teacher.id)));
                  },
                ),
                ListTile(
                  title: const Text(
                      "Professor o`qituvchilarni anketa ma`lumotlari"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                      "Ma`lumotlar va bilimlar bazasini shakillantirish"),
                  onTap: () {},
                ),
              ],
            );
          }),
    );
  }
}
