import 'package:flutter/material.dart';

class RejalarRuyxati extends StatelessWidget {
  const RejalarRuyxati({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
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
            title: const Text(
              "Bajariladigan Rejalar",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }
}
