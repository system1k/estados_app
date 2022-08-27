
class User {

  late String nombre;
  late int edad;
  late List<String>? profesiones;

  User({
    required this.nombre,
    required this.edad,
    this.profesiones
  }); // : assert(profesiones != null); --- Para probocar un error 

}
