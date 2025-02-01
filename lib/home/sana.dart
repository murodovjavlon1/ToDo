import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Sana extends StatefulWidget {
  final void Function(BuildContext) sananiTanlash;

  final DateTime belgilanganKun;
  final void Function() oldingiSana;
  final void Function() kiyingiSana;
  const Sana({
    super.key,
    required this.sananiTanlash,
    required this.belgilanganKun,
    required this.oldingiSana,
    required this.kiyingiSana,
  });

  @override
  State<Sana> createState() => _SanaState();
}

class _SanaState extends State<Sana> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          onPressed: widget.oldingiSana,
          icon: const Icon(
            Icons.arrow_left,
            size: 35,
          ),
        ),
        TextButton(
          onPressed: () {
            widget.sananiTanlash(context);
          },
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
              children: [
                TextSpan(
                  text:
                      DateFormat(' EEEE d  MMM ').format(widget.belgilanganKun),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: widget.kiyingiSana,
          icon: const Icon(
            Icons.arrow_right,
            size: 35,
          ),
        ),
      ],
    );
  }
}

class Two extends StatelessWidget {
  const Two({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "03",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "Barcha rejalaringiz",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "0",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "Bajarilgan  rejalaringiz",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
