import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:estados/controllers/usuario_controller.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final userController = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pagina 1')
      ),
      body: Obx(
        () => userController.existeUsuario.value
          ? UserInfo(user: userController.usuario.value)
          : const NoInfo()
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.next_plan),
        onPressed: () => Get.toNamed('/page2'),
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No hay información del usuario')
    );
  }
}

class UserInfo extends StatelessWidget {

  final User user;

  const UserInfo({
    Key? key, 
    required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text('Generales', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          ListTile(title: Text('Nombre: ${user.nombre}')),
          ListTile(title: Text('Edad: ${user.edad}')),

          const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          ...user.profesiones.map(
            (p) => ListTile(title: Text(p))
          ).toList()              

        ],
      )
    );
  }
}