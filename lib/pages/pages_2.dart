import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:estados/services/usuario_servicies.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final usuarioServices = Provider.of<UsuarioServices>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: (usuarioServices.existeUsuario)
          ? Text('Nombre: ${usuarioServices.usuario!.nombre}')
          : const Text("Pagina 2")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              color: Colors.blue,
              child: const Text('Establecer usuario', style: TextStyle(color: Colors.white)),
              onPressed: (){
                final newUser = User(
                  nombre: 'Julio Fermín', 
                  edad: 31,
                  profesiones: ['Tecnico', 'Programador', 'Instructor']
                );
                usuarioServices.usuario = newUser;
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
              onPressed: () => usuarioServices.agregarProfesion()
            ),

          ],
        )
      ),
    );
  }
}