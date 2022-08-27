import 'package:flutter/material.dart';
import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_services.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: StreamBuilder(
          stream: usuarioServices.userStream,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData 
              ? Text('nombre: ${snapshot.data!.nombre}') 
              : const Text('pagina 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              color: Colors.blue,
              child: const Text('Establecer usuario', style: TextStyle(color: Colors.white)),
              onPressed: (){
                final newUser = User(nombre: 'Julio', edad: 31);
                usuarioServices.loadUser(newUser);
              }
            ),

            MaterialButton(
              color: Colors.blue,
              child: const Text('Cambiar edad', style: TextStyle(color: Colors.white)),
              onPressed: () => usuarioServices.cambiarEdad(29)
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