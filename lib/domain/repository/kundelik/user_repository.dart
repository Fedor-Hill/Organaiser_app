import 'package:organaiser/domain/model/user_context_model/user_context.dart';

abstract class UserRepository {

  Future<UserContextModel> setUser(String login, String password);

  Future<UserContextModel> getUser();

  Future<void> logOut();
   
}
