import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:estados/bloc/usuario/usuario_cubit.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario(), 
          )
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.next_plan),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {

        switch(state.runtimeType) {

          case UsuarioInitial: 
            return const Center(child: Text('No hay información del usuario'));

          case UsuarioActivo:
            return UserInfo((state as UsuarioActivo).usuario);

          default:
            return const Center(child: Text('Estado desconocido'));
        }

        // if (state is UsuarioInitial) {
        //   return const Center(child: Text('No hay información del usuario'));
        // } else if (state is UsuarioActivo) {
        //   return UserInfo(state.usuario);
        // } else {
        //   return const Center(child: Text('Estado desconocido'));
        // }           
        
      }
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

          ...user.profesiones.map((p) => ListTile(
            title: Text(p)
          )).toList()
          
        ],
      )
    );
  }
}