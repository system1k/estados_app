import 'package:flutter/material.dart';
import 'package:estados/models/usuario.dart';

class UsuarioServices with ChangeNotifier {

  User? _usuario;

  User? get usuario => _usuario;
  bool get existeUsuario => (_usuario != null) ? true : false;

  set usuario(User? user) {
    _usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad){
    _usuario!.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    _usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    _usuario!.profesiones!.add('Profesion: ${ _usuario!.profesiones!.length + 1 }');
    notifyListeners();
  }

}