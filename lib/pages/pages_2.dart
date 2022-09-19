import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:estados/models/usuario.dart';
import 'package:estados/controllers/usuario_controller.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final userController = Get.find<UsuarioController>();

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
              onPressed: () {
                userController.cargarUsuario( User(nombre: 'Julio Fermín', edad: 31) );
                Get.snackbar(
                  'Usuario establecido', 
                  'Julio Fermín es el nombre del usuario',
                  backgroundColor: Colors.white,
                  boxShadows:const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10
                    )
                  ]
                );
              }
            ),

            MaterialButton(
              color: Colors.blue,
              child: const Text('Cambiar edad', style: TextStyle(color: Colors.white)),
              onPressed: () => userController.cambiarEdad(29)
            ),

            MaterialButton(
              color: Colors.blue,
              child: const Text('Añadir profesión', style: TextStyle(color: Colors.white)),
              onPressed: () {
                userController.addProfession('Profesión #${userController.profCount + 1}');
              }
            ),

            MaterialButton(
              color: Colors.blue,
              child: const Text('Cambiar tema', style: TextStyle(color: Colors.white)),
              onPressed: () => Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark())
            ),

          ],
        )
      ),
    );
  }
}