// this model is used when receive response from login, registration api
class UserModel {
  String? status;
  String? message;
  UserData? data;

  UserModel({
    this.status,
    this.message,
    this.data,
  });

  UserModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  String? id;
  String? fullName;
  String? emailId;
  String? created;
  String? updated;

  UserData({
    this.id,
    this.fullName,
    this.emailId,
    this.created,
    this.updated,
  });

  UserData.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['full_name'];
    emailId = json['email_id'];
    created = json['created'];
    updated = json['updated'];
  }
}
