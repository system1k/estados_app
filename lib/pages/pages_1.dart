import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:estados/services/usuario_servicies.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final usuarioServices = Provider.of<UsuarioServices>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => usuarioServices.removerUsuario(), 
          )
        ],
      ),
      body: (usuarioServices.existeUsuario) 
        ? UserInfo(usuarioServices.usuario!)
        : const Center(child: Text('No hay información del usuario')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.next_plan),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {

  final User user;
  // ignore: use_key_in_widget_constructors
  const UserInfo(this.user);

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

          ...user.profesiones!.map((profesiones) => ListTile(title: Text(profesiones))).toList()

        ],
      )
    );
  }
}