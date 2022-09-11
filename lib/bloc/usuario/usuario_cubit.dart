import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados/models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
 
  UsuarioCubit() : super(UsuarioInitial());

  void selectUser(User user){
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad){

    final currentState = state;

    if(currentState is UsuarioActivo){
      final newUser = currentState.usuario.copyWith(edad: edad);
      emit(UsuarioActivo(newUser));
    }
  }

  void addProfesion(String profesion){

    final currentState = state;

     if(currentState is UsuarioActivo){
      
      final List<String> newList = [
        ...currentState.usuario.profesiones,
        '$profesion ${currentState.usuario.profesiones.length + 1}'
      ];

      final newUser = currentState.usuario.copyWith(profesiones: newList);
      emit(UsuarioActivo(newUser));
    }

  }

  void borrarUsuario() => emit(UsuarioInitial());  

}