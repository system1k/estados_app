import 'package:get/get.dart';
import 'package:estados/models/usuario.dart';

class UsuarioController extends GetxController {

  var existeUsuario = false.obs;
  var usuario = User().obs;

  get profCount => usuario.value.profesiones.length;

  void cargarUsuario(User user) {
    existeUsuario.value = true;
    usuario.value = user;
  }

  void cambiarEdad(int edad) {
    usuario.update( (value) => value!.edad = edad );
  }

  void addProfession(String profession) {
    usuario.update( (value) {
      value!.profesiones = [...value.profesiones, profession]; 
    });
  }

}
