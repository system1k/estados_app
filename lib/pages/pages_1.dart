import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_services.dart';
import 'package:flutter/material.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pagina 1')
      ),
      body: StreamBuilder(
        stream: usuarioServices.userStream,       
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData
            ? UserInfo(snapshot.data!)
            : const Center(child: Text('No hay información del usuario'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.next_plan),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  
  final User usuario;  
  // ignore: use_key_in_widget_constructors
  const UserInfo(this.usuario);

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

          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),

          const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          const ListTile(title: Text('Profesion 1')),
          const ListTile(title: Text('Profesion 2')),
          const ListTile(title: Text('Profesion 3'))        

        ],
      )
    );
  }
}