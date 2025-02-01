import 'package:algaortim/models/reja_model.dart';
import 'package:flutter/material.dart';

class Reja extends StatelessWidget {
  final RejaModel reja;
  const Reja(this.reja);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.delete),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.circle_outlined,
          size: 18,
        ),
      ),
      title:  Text(
        reja.nomi,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
