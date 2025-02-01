import 'package:algaortim/home/reja.dart';
import 'package:algaortim/models/reja_model.dart';
import 'package:flutter/material.dart';

class RejalarRuyxati extends StatelessWidget {
  final List<RejaModel> plan;

  const RejalarRuyxati({
    super.key, required this.plan,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: plan.length,
        itemBuilder: (context, index) {
          return  Reja(plan[index]);
        },
      ),
    );
  }
}
