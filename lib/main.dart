import 'package:app_imc/input_widget.dart';
import 'package:app_imc/result_page.dart';
import 'package:flutter/material.dart';

// 254 linhas
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int altura = 170;
  int peso = 65;
  String resultado = 'NORMAL';
  double limite_inferior = 0;
  double limite_superior = 0;

  double calcularIMC() {
    int conversorAltura = 100;
    return peso / ((altura / conversorAltura * altura / conversorAltura));
  }

  void diminuiPeso() => setState(() {
    peso--;
  });

  void aumentaPeso() => setState(() {
    peso++;
  });

  void diminuiAltura() => setState(() {
    altura--;
  });

  void aumentaAltura() => setState(() {
    altura++;
  });

  void atualizarResultado() {
    setState(() {
      double imc = calcularIMC();

      if (imc < 18.5) {
        resultado = 'BAIXO PESO';
        limite_inferior = 0;
        limite_superior = 18.4;
      } else if (imc <= 24.9) {
        resultado = 'NORMAL';
        limite_inferior = 18.5;
        limite_superior = 24.9;
      } else if (imc <= 29.9) {
        resultado = 'SOBREPESO';
        limite_inferior = 25;
        limite_superior = 29.9;
      } else if (imc <= 34.9) {
        resultado = 'OBESIDADE 1';
        limite_inferior = 30;
        limite_superior = 34.9;
      } else if (imc <= 39.9) {
        resultado = 'OBESIDADE 2';
        limite_inferior = 35;
        limite_superior = 39.9;
      } else {
        resultado = 'OBESIDADE 3';
        limite_inferior = 40;
        limite_superior = double.infinity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade400,
        title: Text(
          'App IMC - SENAC',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            InputWidget(
              onPressedLess: () => diminuiAltura(),
              onPressedMore: () => aumentaAltura(),
              unitLabel: 'cm',
              valueLabel: altura.toString(),
            ),
            SizedBox(height: 50),
            InputWidget(
              onPressedLess: () => diminuiPeso(),
              onPressedMore: () => aumentaPeso(),
              unitLabel: 'Kg',
              valueLabel: peso.toString(),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                atualizarResultado();
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => ResultPage(
                      resultado: resultado,
                      limite_inferior: limite_inferior,
                      limite_superior: limite_superior,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                child: Text(
                  'Calcular',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (context) => const SecondScreen(),
    ),
  );
*/

/*
  Navigator.of(context).pop();
*/