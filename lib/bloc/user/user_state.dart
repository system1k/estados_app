part of 'user_bloc.dart';

@immutable
abstract class UserState {

  final bool existUser;
  final User? user;

  const UserState({
    this.existUser = false, 
    this.user
  });

}

class UserInitialState extends UserState {
  const UserInitialState() :
    super(existUser: false, user: null);
}

class UserSetState extends UserState {  
  // ignore: annotate_overrides, overridden_fields
  final User user;
  const UserSetState(this.user) :
    super(existUser: true, user: user);
}