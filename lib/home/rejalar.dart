import 'package:algaortim/home/rejalar_ruyxati.dart';
import 'package:algaortim/home/sana.dart';
import 'package:flutter/material.dart';

class Rejalar extends StatefulWidget {
  const Rejalar({super.key});

  @override
  State<Rejalar> createState() => _RejalarState();
}

class _RejalarState extends State<Rejalar> {
  DateTime belgilanganKun = DateTime.now();
  void sananiTanlash(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    ).then((TanlanganSana) => {
          if (TanlanganSana != null)
            {
              setState(() {
                belgilanganKun = TanlanganSana;
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: Column(
        children: <Widget>[
          Sana(
            belgilanganKun: belgilanganKun,
            sananiTanlash: sananiTanlash,
          ),
          const Two(),
          const RejalarRuyxati(),
        ],
      ),
    );
  }
}
