import 'package:algaortim/home/reja.dart';
import 'package:algaortim/models/reja_model.dart';
import 'package:flutter/material.dart';

class RejalarRuyxati extends StatelessWidget {
  final List<RejaModel> plan;
  final Function bajarilganDebBelgila;
  final Function rejaniUchrish;
  final Function sananiTanlash;

  const RejalarRuyxati({
    super.key,
    required this.plan,
    required this.bajarilganDebBelgila,
    required this.rejaniUchrish,
    required this.sananiTanlash,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: plan.length,
        itemBuilder: (context, index) {
          return Reja(
            plan[index],
            bajarilganDebBelgila,
            rejaniUchrish,
          );
        },
      ),
    );
  }
}
