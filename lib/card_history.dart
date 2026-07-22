import 'package:flutter/material.dart';

class CardHistory extends StatelessWidget {
  final String title;
  final String peso;
  final String altura;
  final String resultado;

  const CardHistory({
    super.key,
    required this.altura,
    required this.peso,
    required this.resultado,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(peso),
              Text(altura),
              Text(resultado),
            ],
          ),
        ],
      ),
    );
  }
}
