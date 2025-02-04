import 'package:algaortim/models/reja_model.dart';
import 'package:flutter/material.dart';

class Reja extends StatelessWidget {
  final RejaModel reja;
  final Function bajarilganDebBelgila;
  final Function rejaniUchrish;

  const Reja(
    this.reja,
    this.bajarilganDebBelgila,
    this.rejaniUchrish,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      trailing: IconButton(
        onPressed: () {
          rejaniUchrish(reja.id);
        },
        icon: const Icon(Icons.delete),
      ),
      leading: IconButton(
        onPressed: () {
          bajarilganDebBelgila(reja.id);
        },
        icon: Icon(
          reja.bajarildi ? Icons.check_circle_outline : Icons.circle_outlined,
          color: reja.bajarildi ? Colors.green : Colors.grey,
          size: 18,
        ),
      ),
      title: Text(
        reja.nomi,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            decoration: reja.bajarildi
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: reja.bajarildi ? Colors.grey : Colors.black),
      ),
    );
  }
}
