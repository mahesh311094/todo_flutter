import 'package:get_storage/get_storage.dart';

// this class is used to store data in shared preference
class SharedPreference {
  final box = GetStorage();

  final userId = "user_id";
  final userName = "user_name";
  final emailId = "email_id";
  final authToken = "auth_token";

  String? getUserId() => box.read(userId);

  void setUserId(String? userId) => box.write(this.userId, userId);

  String? getUserName() => box.read(userName);

  void setUserName(String? userName) => box.write(this.userName, userName);

  String? getEmail() => box.read(emailId);

  void setEmail(String? emailId) => box.write(this.emailId, emailId);

  void logout() => box.erase();
}
