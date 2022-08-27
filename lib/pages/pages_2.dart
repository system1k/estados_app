import 'package:flutter/material.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pagina 2')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              color: Colors.blue,
              child: const Text('Establecer usuario', style: TextStyle(color: Colors.white)),
              onPressed: (){}
            ),

            MaterialButton(
              color: Colors.blue,
              child: const Text('Cambiar edad', style: TextStyle(color: Colors.white)),
              onPressed: (){}
            ),

            MaterialButton(
              color: Colors.blue,
              child: const Text('Añadir profesión', style: TextStyle(color: Colors.white)),
              onPressed: (){}
            ),

          ],
        )
      ),
    );
  }
}