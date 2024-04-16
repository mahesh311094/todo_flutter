// this model is used when receive response from get TaskList api
class TodoModel {
  String? status;
  String? message;
  List<TodoData>? data;

  TodoModel({
    this.status,
    this.message,
    this.data,
  });

  TodoModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = List<TodoData>.from(json["data"].map((x) => TodoData.fromJson(x)));
  }
}

class TodoData {
  String? id;
  String? title;
  String? description;
  String? status;
  String? created;
  String? updated;

  TodoData({
    this.id,
    this.title,
    this.description,
    this.status,
    this.created,
    this.updated,
  });

  TodoData.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    created = json['created'];
    updated = json['updated'];
  }
}
