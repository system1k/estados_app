import 'dart:async';
import 'package:estados/models/usuario.dart';

class _UsuarioServices {

  User? _usuario;
  final StreamController<User> _userStreamController = StreamController<User>.broadcast();

  User? get user => _usuario;
  // bool get existeUsuario => (_usuario != null) ? true : false;
  Stream<User> get userStream => _userStreamController.stream;

  void loadUser(User user) {
    _usuario = user;
    _userStreamController.add(user);
  }

  void cambiarEdad(int edad) {
    _usuario!.edad = edad;
    _userStreamController.add(_usuario!);
  }

  dispose() => _userStreamController.close();

}

final usuarioServices = _UsuarioServices();