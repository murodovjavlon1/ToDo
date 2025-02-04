import 'package:algaortim/home/rejalar_ruyxati.dart';
import 'package:algaortim/home/sana.dart';
import 'package:algaortim/models/reja_model.dart';
import 'package:flutter/material.dart';

class Rejalar extends StatefulWidget {
  const Rejalar({super.key});

  @override
  State<Rejalar> createState() => _RejalarState();
}

class _RejalarState extends State<Rejalar> {
  final List<RejaModel> _rejalar = RejalarR().ruyxat;

  DateTime _belgilanganKun = DateTime.now();
  void _sananiTanlash(BuildContext context) {
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
      _rejalar.firstWhere((reja) => reja.id == rejaId).bajarildiniUzgartirish();
    });
  }

  void _rejaniUchrish(String rejaId) {
    setState(() {
      _rejalar.removeWhere((reja) => reja.id == rejaId);
    });
  }

  void _rejaQushishEkraniniOchish(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Reja nomi",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Reja Kun Tanlanmagan..."),
                  TextButton(
                    onPressed: () {},
                    child: Text("KUNNI TANLASH"),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "BEKOR QILISH",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "KRITISH",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
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
            sananiTanlash: _sananiTanlash,
            oldingiSana: _oldingiSana,
            kiyingiSana: _kiyingiSana,
          ),
          Two(rejalar: _rejalar),
          RejalarRuyxati(
            plan: _rejalar,
            bajarilganDebBelgila: _bajarilganDebBelgila,
            rejaniUchrish: _rejaniUchrish,
          ),
        ],
      ),
    );
  }
}
