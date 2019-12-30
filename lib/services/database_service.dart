import 'package:instagram_clone/Models/user_models.dart';
import 'package:instagram_clone/Utitlies/constants.dart';

class DatabaseService{
  static void updateUser(User user){
    usersRef.document(user.id).updateData({
      'name':user.name,
      'profileImageUrl':user.profileImageUrl,
      'bio':user.bio
    });

  }
}