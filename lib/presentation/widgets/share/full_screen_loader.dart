import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  final messages = <String>[
    'Cargando películas',
    'Cargando series',
    'Cargando películas populares',
    'Cargando películas próximas',
    'Cargando películas mejor valoradas',
  ];

  Stream<String> getLoadinMessages() {
    return Stream.periodic(const Duration(seconds: 1), (step) {
      return messages[step % messages.length];
    }).take(messages.length);
  }

  FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Espere un momento..."),
          const SizedBox(height: 20),
          const CircularProgressIndicator(),
          const SizedBox(height: 20),
          StreamBuilder(
            stream: getLoadinMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Cardando...');
              return Text(snapshot.data!);
            },
          )
        ],
      ),
    );
  }
}
