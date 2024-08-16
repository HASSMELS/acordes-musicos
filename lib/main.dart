import 'package:flutter/material.dart';

void main() {
  runApp(AcordesApp());
}

class AcordesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acordes App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AcordesPage(),
    );
  }
}
class AcordesPage extends StatefulWidget {
  @override
  _AcordesPageState createState() => _AcordesPageState();
}

class _AcordesPageState extends State<AcordesPage> {
  // Define los acordes para cada nota
  final Map<String, List<String>> acordes = {
    "Do": ["Do", "Re", "Mi", "Fa", "Sol", "La", "Si", "Do"],
    "Do#": ["Do#", "Re#", "Fa", "Fa#", "Sol#", "La#", "Do", "Do#"],
    "Re": ["Re", "Mi", "Fa#", "Sol", "La", "Si", "Do#", "Re"],
    "Re#": ["Re#", "Fa", "Sol", "Sol#", "La#", "Do", "Re", "Re#"],
    "Mi": ["Mi", "Fa#", "Sol#", "La", "Si", "Do#", "Re#", "Mi"],
    "Fa": ["Fa", "Sol", "La", "La#", "Do", "Re", "Mi", "Fa"],
    "Fa#": ["Fa#", "Sol#", "La#", "Si", "Do#", "Re#", "Do", "Fa"],
    "Sol": ["Sol", "La", "Si", "Do", "Re", "Mi", "Fa#", "Sol"],
    "Sol#": ["Sol#", "La#", "Do", "Do#", "Re#", "Fa", "Sol", "Sol#"],
    "La": ["La", "Si", "Do#", "Re", "Mi", "Fa#", "Sol#", "La"],
    "La#": ["La#", "Do", "Re", "Re#", "Fa", "Sol", "La", "La#"],
    "Si": ["Si", "Do#", "Re#", "Mi", "Fa#", "Sol#", "La#", "Si"]
  };

  List<String> _currentAcordes = List<String>.filled(8, '');

  void _mostrarAcordes(String nota) {
    setState(() {
      _currentAcordes = acordes[nota]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Acordes App')),
      body: Column(
        children: <Widget>[
          // Fila de botones de notas
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: acordes.keys.map((nota) {
              return ElevatedButton(
                onPressed: () => _mostrarAcordes(nota),
                child: Text(nota),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          // Fila de números
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(8, (index) {
              return Container(
                width: 40,
                alignment: Alignment.center,
                child: Text('${index + 1}', textAlign: TextAlign.center),
              );
            }),
          ),
          SizedBox(height: 10),
          // Fila de acordes
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _currentAcordes.map((acorde) {
              return Container(
                width: 40,
                alignment: Alignment.center,
                child: Text(acorde, textAlign: TextAlign.center),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}



