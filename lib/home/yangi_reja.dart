import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YangiReja extends StatefulWidget {
  final Function rejaniQushi;
  const YangiReja({
    super.key,
    required this.rejaniQushi,
  });

  @override
  State<YangiReja> createState() => _YangiRejaState();
}

DateTime? rejaUshunbelgilanganKun;
final _rejaNomiController = TextEditingController();

class _YangiRejaState extends State<YangiReja> {
  void _rejaniQushishUchunKalindar(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then(
      // ignore: non_constant_identifier_names
      (RejaniSanasi) => {
        if (RejaniSanasi != null)
          {
            setState(
              () {
                rejaUshunbelgilanganKun = RejaniSanasi;
              },
            ),
          }
      },
    );
  }

  void sumbit() {
    if (_rejaNomiController.text.isEmpty || rejaUshunbelgilanganKun == null) {
      return; //qaytarib yubor
    }
    widget.rejaniQushi(_rejaNomiController.text, rejaUshunbelgilanganKun);
    //Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          TextField(
            controller: _rejaNomiController,
            decoration: const InputDecoration(
              labelText: "Reja nomi",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(rejaUshunbelgilanganKun == null
                  ? "Reja kuni tanlanmadi..."
                  : DateFormat("EEEE, d, MMMM,")
                      .format(rejaUshunbelgilanganKun!)),
              TextButton(
                onPressed: () {
                  _rejaniQushishUchunKalindar(context);
                },
                child: const Text("KUNNI TANLASH"),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                onPressed: () {
                 // Navigator.pop(context);
                },
                child: const Text(
                  "BEKOR QILISH",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: sumbit,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "KRITISH",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
