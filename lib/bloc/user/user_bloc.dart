// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:estados/models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  UserBloc() : super(const UserInitialState()) {

    on<ActivateUser>((event, emit) => emit( UserSetState(event.user) ));

    on<DeleteUser>((event, emit) => emit( const UserInitialState() ));

    on<ChangeUserAge>(((event, emit) {
      if(!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    }));

    on<AddProfession>(((event, emit) {
      if(!state.existUser) return;
      final List<String> newList = [...state.user!.profesiones, event.profesion]; 
      emit(UserSetState(state.user!.copyWith(profesiones: newList)));
    }));

  }

}