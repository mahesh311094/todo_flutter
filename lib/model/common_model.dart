// this model is used when receive response from api
// which contains only status and message
class CommonModel {
  String? status;
  String? message;

  CommonModel({
    this.status,
    this.message,
  });

  CommonModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
}
