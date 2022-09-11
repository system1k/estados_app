import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:estados/bloc/usuario/usuario_cubit.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final usuarioCubit = context.read<UsuarioCubit>();

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
              onPressed: (){

                final user = User(
                  nombre: 'Julio Fermín', 
                  edad: 31, 
                  profesiones: [
                    'Programador',
                    'Tecnico informatica'
                  ]
                );

                usuarioCubit.selectUser(user);
              }
            ),

            MaterialButton(
              color: Colors.blue,
              child: const Text('Cambiar edad', style: TextStyle(color: Colors.white)),
              onPressed: () => usuarioCubit.cambiarEdad(29)              
            ),

            MaterialButton(
              color: Colors.blue,
              child: const Text('Añadir profesión', style: TextStyle(color: Colors.white)),
              onPressed: () => usuarioCubit.addProfesion('Profesion #')
            ),

          ],
        )
      ),
    );
  }
}