import 'package:algaortim/home/rejalar_ruyxati.dart';
import 'package:algaortim/home/sana.dart';
import 'package:algaortim/home/yangi_reja.dart';
import 'package:algaortim/models/reja_model.dart';
import 'package:flutter/material.dart';

class Rejalar extends StatefulWidget {
  const Rejalar({super.key});

  @override
  State<Rejalar> createState() => _RejalarState();
}

class _RejalarState extends State<Rejalar> {
  final RejalarR _rejalar = RejalarR();

  DateTime _belgilanganKun = DateTime.now();

  void sananiTanlash(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
      // ignore: non_constant_identifier_names
    ).then((TanlanganSana) => {
          if (TanlanganSana != null)
            {
              setState(() {
                _belgilanganKun = TanlanganSana;
              })
            }
        });
  }

  void _oldingiSana() {
    setState(() {
      _belgilanganKun = DateTime(
        _belgilanganKun.year,
        _belgilanganKun.month,
        _belgilanganKun.day - 1,
      );
    });
  }

  void _kiyingiSana() {
    setState(() {
      _belgilanganKun = DateTime(
        _belgilanganKun.year,
        _belgilanganKun.month,
        _belgilanganKun.day + 1,
      );
    });
  }

  void _bajarilganDebBelgila(String rejaId) {
    setState(() {
      _rejalar.ruyxat
          .firstWhere((reja) => reja.id == rejaId)
          .bajarildiniUzgartirish();
    });
  }

  void _rejaniUchrish(String rejaId) {
    setState(() {
      _rejalar.ruyxat.removeWhere((reja) => reja.id == rejaId);
    });
  }

  void _rejaQushishEkraniniOchish(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return YangiReja(
          rejaniQushi: _rejaniQushi,
        );
      },
    );
  }

  void _rejaniQushi(String rejaNomi, DateTime rejaKuni) {
   
    setState(() {
     // _rejalar.addToDo(rejaNomi, rejaKuni);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
        onPressed: () {
          _rejaQushishEkraniniOchish(context);
        },
      ),
      body: Column(
        children: <Widget>[
          Sana(
            belgilanganKun: _belgilanganKun,
            sananiTanlash: sananiTanlash,
            oldingiSana: _oldingiSana,
            kiyingiSana: _kiyingiSana,
          ),
          Two(rejalar: _rejalar.ruyxat),
          RejalarRuyxati(
            sananiTanlash: sananiTanlash,
            plan: _rejalar.ruyxat,
            bajarilganDebBelgila: _bajarilganDebBelgila,
            rejaniUchrish: _rejaniUchrish,
          ),
        ],
      ),
    );
  }
}
