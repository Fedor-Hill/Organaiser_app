import 'package:organaiser/domain/model/person.dart';
import 'package:organaiser/domain/model/user/user.dart';

abstract class UserRepository {
  // First login 
  Future<UserModel> signInUser(String login, String password);

  // From token in storage get UserContext  
  Future<UserModel> setUser();

  // Delete token 
  Future<void> delUser();

  Future<PersonData> getClassmate();
  
}
