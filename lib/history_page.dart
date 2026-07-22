import 'package:app_imc/card_history.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool isLoading = false;
  FirebaseFirestore db = FirebaseFirestore.instance;

  QuerySnapshot<Map<String, dynamic>>? dados;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });

    super.initState();

    // final data = await db.collection('historico_calculo').get();
    db.collection('historico_calculo').get().then((data) {
      dados = data;
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        centerTitle: true,
        title: Text('Histórico', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
            padding: EdgeInsets.all(20),
              itemCount: dados?.docs.length ?? 0,
              itemBuilder: (context, index) => CardHistory(
                title: 'Cálculo ${index + 1}',
                altura: 'Altura: ${dados?.docs[index]['altura'] ?? 'dado inválido'}',
                peso: 'Peso: ${dados?.docs[index]['peso'] ?? 'dado inválido'}',
                resultado: 'Resultado: ${dados?.docs[index]['resultado_imc'] ?? 'dado inválido'}',
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 12,),
            ),
    );
  }
}
