import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
  final _inputAltura = TextEditingController();
  final _inputPeso = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double _resultado = 0;
  String _label = '';
  Color _cor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _cor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'I.M.C.',
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Índice de Massa Corporal',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _inputAltura,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Altura',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe sua Altura';
                        }
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: _inputPeso,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Peso',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe seu Peso';
                        }
                      },
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _resultado = double.parse(_inputPeso.text) /
                              (double.parse(_inputAltura.text) *
                                  double.parse(_inputAltura.text));

                          if (_resultado < 18.5) {
                            _label = 'Magreza';
                            _cor = Colors.red;
                          } else if (_resultado >= 18.5 && _resultado <= 24.9) {
                            _label = 'Normal';
                            _cor = Colors.green;
                          } else if (_resultado > 25.0 && _resultado <= 29.9) {
                            _label = 'Sobrepeso';
                            _cor = const Color.fromARGB(255, 180, 180, 3);
                          } else if (_resultado > 30 && _resultado <= 34.9) {
                            _label = 'Obesidade grau I';
                            _cor = Color.fromARGB(255, 240, 136, 8);
                          } else if (_resultado > 35 && _resultado <= 39.9) {
                            _label = 'Obesidade grau II';
                            _cor = const Color.fromARGB(255, 255, 89, 0);
                          } else {
                            _label = 'Obesidade grau III';
                            _cor = Colors.red;
                          }
                          setState(() {});
                        }
                      },
                      child: Text(
                        'Calcular',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(5),
                      ),
                    ),
                    GestureDetector(
                      onLongPress: () {
                        _cor = Colors.black;
                        _inputAltura.clear();
                        _inputPeso.clear();
                        _label = '';

                        setState(() {});
                      },
                      child: Text(
                        _label,
                        style: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
