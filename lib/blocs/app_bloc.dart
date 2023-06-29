import '../repos/repositories.dart';
import 'app_event.dart';
import 'app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserBloc extends Bloc<UserEvent,UserState>{
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()){
    on<LoadUserEvent>((event,emit) async{
      emit(UserLoadingState());
      try{
        final user = await _userRepository.getUser();
        emit(UserLoadedState(user));
      }catch(e){
        emit(UserErrorState(e.toString()));
      }
      print('you emitted a bloc');
      // emit(UserLoadedState());
    });
  }
}
